//
//  YogaView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 1/29/25.
//

import SwiftUI

struct yogaView: View {
    let gridItems = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]
    
    @State var fullScreenView: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Yoga")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .padding()
                    
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
                    
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(1...10, id: \.self) { image in
                            NavigationLink(destination: yogDetailsView()) {
                                Image("lotusPose")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $fullScreenView) {
                    history()
                }
            }
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
j}
