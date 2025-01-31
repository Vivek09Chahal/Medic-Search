//
//  YogaView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 1/29/25.
//

import SwiftUI

struct yogaView: View {
    @State var fullScreenView: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Yoga")
                .font(.system(size: 45, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],x
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding()
            
            ScrollView {
                HStack() {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(getBenefits(), id: \.self) { benefit in
                            BenefitRow(text: benefit)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.thinMaterial)
                    )
                    
                    Button {
                        withAnimation {
                            fullScreenView = true
                        }
                    } label: {
                        Text("History")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(.yellow)
                                    .frame(width: 160, height: 50)
                            )
                    }
                    .rotationEffect(.degrees(90))
                }
            }
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $fullScreenView) {
            history()
        }
        
        ScrollView(.horizontal){
            
        }
        
    }
    
    private func getBenefits() -> [String] {
        return [
            "• Improves posture and balance🏃‍♀️",
            "• Creates inner peace and st🧘‍♂️bility",
            "• Enhances joint health and mobi🦿ity",
            "• Improves bre🫁thing and energy levels",
            "• Supports heart health and circulati❤️n",
            "• Reduces stress and promotes rel🧠xation",
            "• Enh🧘‍♀️nces flexibility and muscle strength"
        ]
    }
}

struct BenefitRow: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
    }
}

#Preview {
    yogaView()
}
