//
//  CustomListCell.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct CustomListCell: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "An alien that is smiling in the park."
    
    var body: some View {
        HStack(spacing: 8) {
            imageSection
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 60)
                .cornerRadius(16)
            
            textSection
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))
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
            if let title {
                Text(title)
                    .font(.headline)
            }
            if let subtitle {
                Text(subtitle)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        VStack {
            CustomListCell()
            CustomListCell(imageName: nil)
            CustomListCell(title: nil)
            CustomListCell(subtitle: nil)
        }
    }
}
