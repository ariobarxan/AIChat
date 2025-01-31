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

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        messageView(message)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }

            Rectangle()
                .frame(height: 50)
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
    }

    private func messageView(_ message: ChatMessageModel) -> some View {
        let isCurrentUser = message.authorId == currentUser?.userId
        return ChatBubbleViewBuilder(
            message: message,
            isCurrentUser: isCurrentUser,
            imageName: isCurrentUser ? nil : avatar?.profileImageName
        )
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
