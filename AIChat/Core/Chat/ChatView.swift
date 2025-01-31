//
//  ChatView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ChatView: View {

    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock
    @State private var textFieldText: String = ""
    @State private var scrollPosition: String?
    @State private var showAlert: AnyAppAlert?
    @State private var showChatSettings: AnyAppAlert?

    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection

            textFieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .showCustomAlert(type: .confirmationDialog, alert: $showChatSettings)
        .showCustomAlert(alert: $showAlert)
    }

    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    messageView(message)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }

    private func messageView(_ message: ChatMessageModel) -> some View {
        let isCurrentUser = message.authorId == currentUser?.userId
        return ChatBubbleViewBuilder(
            message: message,
            isCurrentUser: isCurrentUser,
            imageName: isCurrentUser ? nil : avatar?.profileImageName
        )
        .id(message.id)
    }

    private var textFieldSection: some View {

        var sendButton: some View {
            Image(systemName: "arrow.up.circle.fill")
                .font(.system(size: 32))
                .padding(.trailing, 4)
                .foregroundStyle(.accent)
                .anyButton(.plain, action: {
                    onSendMessagePressed()
                })
        }

        var background: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color(uiColor: .systemBackground))

                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            }
        }

        return TextField("Say something...", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(alignment: .trailing, content: {sendButton})
            .background(background)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }

    private func onSendMessagePressed() {
        guard let currentUser else { return }

        let content = textFieldText

        do {
            try TextValidationHelper.checkIfTextIsValid(text: content)

            let message = ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authorId: currentUser.userId,
                content: content,
                seenByIds: nil,
                dateCreated: .now
            )
            chatMessages.append(message)

            scrollPosition = message.id

            textFieldText = ""
        } catch {
            showAlert = AnyAppAlert(error: error)
        }
    }

    private func onChatSettingsPressed() {
        var dialogueButtons: any View {

                Group {
                    Button("Report User / Chat", role: .destructive) {

                    }
                    Button("Delete Chat", role: .destructive) {

                    }
                }

        }
        showChatSettings = AnyAppAlert(
            title: "",
            subtitle: "What would you like to do?",
            buttons: {
                AnyView(dialogueButtons)
            }
        )
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
