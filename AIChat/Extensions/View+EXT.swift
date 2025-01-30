//
//  View+EXT.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

extension View {

    func callToActionButtonStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }

}
