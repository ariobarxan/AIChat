//
//  CategoryCell.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct CategoryCell: View {

    var title: String = "Aliens"
    var imageName: String = Constants.randomImage
    var font: Font = .title2
    var cornerRadius: CGFloat = 16

    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading, content: titleText)
            .cornerRadius(cornerRadius)
    }

    private func titleText() -> some View {
        Text(title)
            .font(font)
            .fontWeight(.semibold)
            .padding(16)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .addingGradientBackgroundForText()
    }
}

#Preview {
    VStack {
        CategoryCell()
            .frame(width: 150)

        CategoryCell()
            .frame(width: 300)
    }
}
