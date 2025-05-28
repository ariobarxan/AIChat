//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Ario Liyan on 28/5/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resisinzMode: ContentMode = .fill
    
    var body: some View {
        // to make it clipped and respect the set frame
        Rectangle()
            .overlay(
        WebImage(url: URL(string: urlString))
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: resisinzMode)
            .allowsHitTesting(false)
        )
    
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 100)
}
