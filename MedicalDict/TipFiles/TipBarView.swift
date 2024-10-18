//
//  TipBarView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 14/09/24.
//

import SwiftUI

struct TipBarView: View {
    
    @State private var length = DailyTips.tips.count
    @State private var flippedIndex: Int? = nil
    
    var body: some View {
        ZStack {
            Image("descriptionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(0 ..< length, id: \.self) { index in
                        Image("img\(index + 1)")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 300, height: 200)
                            .padding()
                    }
                }
            }
            .scaleEffect(1)
            .frame(width: 800)
        }
    }
}

#Preview {
    TipBarView()
}
