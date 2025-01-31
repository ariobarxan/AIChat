//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ChatBubbleView: View {

    var text: String = "This is sample text."
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?

    let offset: CGFloat = 14

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                profileImage
            }

            chatText
        }
        .padding(.bottom, showImage ? offset : 0)
    }

    private var profileImage: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.secondary)
            }
        }
        .frame(width: 45, height: 45)
        .clipShape(Circle())
        .offset(y: offset)
    }

    private var chatText: some View {
        Text(text)
            .font(.body)
            .foregroundStyle(textColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .cornerRadius(6)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            ChatBubbleView(text: "This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going. This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going.")

            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )

            ChatBubbleView(
                text: "This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going. This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
        }
        .padding(8)
    }
}
