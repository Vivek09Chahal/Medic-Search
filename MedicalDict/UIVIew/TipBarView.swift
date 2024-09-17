//
//  TipBarView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 14/09/24.
//

import SwiftUI

struct TipBarView: View {
    
    @State private var length = DailyTips.tips.count
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack() {
                ForEach(0 ..< length, id: \.self) { index in
                    ZStack{
                        Image("img")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 300, height: 200)
                            .blur(radius: 3)
                        
                        Text(DailyTips.tips[index])
                            .font(.title2)
                            .foregroundStyle(.black)
                            .frame(width:300, height: 200)
                    }
                    .containerRelativeFrame(.horizontal)
                    .visualEffect { content, proxy in
                        content
                            .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                    }
                }
            }
            .onAppear(perform: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    TipBarView()
}
