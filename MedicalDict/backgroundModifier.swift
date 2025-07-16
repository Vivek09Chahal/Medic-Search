//
//  backgroundModifier.swift
//  MedicalDict
//
//  Created by Vivek on 5/5/25.
//

import Foundation
import SwiftUI

struct backGroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.black.opacity(0.2))
            }
    }
}

extension View {
    public func backGround() -> some View {
        modifier(backGroundModifier())
    }
}

struct linearBackgroundModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background{
                LinearGradient(
                    colors: [
                        Color(red: 0.88, green: 0.27, blue: 0.44),
                        Color(red: 0.83, green: 0.47, blue: 0.10)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
            }
    }
}

extension View {
    public func linearBackground() -> some View {
        modifier(linearBackgroundModifier())
    }
}
