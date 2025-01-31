//
//  HeroCell.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct HeroCell: View {

    var title: String? = "This is some title"
    var subtitle: String? = "This is some subtitle that will go here."
    var imageName: String? = Constants.randomImage

    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading, content: texts)
        .cornerRadius(16)
    }

    func texts() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title {
                Text(title)
                    .font(.headline)
            }
            if let subtitle {
                Text(subtitle)
                    .font(.subheadline)
            }
        }
        .foregroundStyle(.white)
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(textsBackground)
    }

    private var textsBackground: some View {
        LinearGradient(colors: [
            Color.black.opacity(0),
            Color.black.opacity(0.3),
            Color.black.opacity(0.4)
        ], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCell()
                .frame(width: 300, height: 200)

            HeroCell()
                .frame(width: 300, height: 400)

            HeroCell()
                .frame(width: 200, height: 400)

            HeroCell(imageName: nil)
                .frame(width: 300, height: 200)

            HeroCell(title: nil)
                .frame(width: 300, height: 200)

            HeroCell(subtitle: nil)
                .frame(width: 300, height: 200)
        }
        .frame(maxWidth: .infinity)
    }
}
