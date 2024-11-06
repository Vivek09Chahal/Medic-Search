//
//  TipImageButton.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 11/2/24.
//

import SwiftUI

struct TipImageButton: View {
    let index: Int
    @Binding var selectedIndex: Int?
    @Binding var isTapViewVisible: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeIn(duration: 0.3)) {
                selectedIndex = index
                isTapViewVisible = true
            }
        } label: {
            Image("img\(index + 1)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300 ,height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(radius: 5)
                .padding(.vertical)
        }
        .accessibilityLabel("Tip \(index + 1)")
    }
}

#Preview{
    TipImageButton(index: 0, selectedIndex: .constant(nil), isTapViewVisible: .constant(false))
}
