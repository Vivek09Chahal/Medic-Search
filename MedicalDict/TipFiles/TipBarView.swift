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
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                    ForEach(0 ..< length, id: \.self) { index in
                        ZStack {
                            if flippedIndex == index {
                                Text(DailyTips.tips[index])
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .frame(width: 300, height: 200)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                                    .shadow(radius: 5)
                                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                    .onTapGesture {
                                        withAnimation {
                                            if flippedIndex == index {
                                                flippedIndex = nil
                                            } else {
                                                flippedIndex = index
                                            }
                                        }
                                    }
                            } else {
                                Image("img")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .frame(width: 300, height: 200)
                                    .onTapGesture {
                                        withAnimation {
                                            flippedIndex = index
                                        }
                                    }
                            }
                        }
                        .rotation3DEffect(.degrees(flippedIndex == index ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    TipBarView()
}
