//
//  ChatRowCell.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ChatRowCell: View {

    var imageName: String? = Constants.randomImage
    var headline: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat."
    var hasNewChat: Bool = true

    var body: some View {
        HStack(spacing: 8) {
            imageSection
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            textSection
                .frame(maxWidth: .infinity, alignment: .leading)

            if hasNewChat {
                newBadge
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: UIColor.systemBackground))
    }

    private var imageSection: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.secondary.opacity(0.5))
            }
        }

    }

    private var textSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let headline {
                Text(headline)
                    .font(.headline)
            }
            if let subheadline {
                Text(subheadline)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var newBadge: some View {
        Text("NEW")
            .font(.caption)
            .bold()
            .foregroundStyle(Color.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.blue)
            .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()

        List {
            ChatRowCell()
                .removeListRowFormatting()
            ChatRowCell(hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCell(imageName: nil)
                .removeListRowFormatting()
            ChatRowCell(headline: nil, hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCell(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }
    }
}
