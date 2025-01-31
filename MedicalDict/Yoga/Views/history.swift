//
//  SwiftUIView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 1/29/25.
//

import SwiftUI

struct history: View {
    @Environment(\.dismiss) private var dismiss
    // Add color palette array
    private let timelineColors: [Color] = [
        Color(hex: "FAC67A"),
        Color(hex: "FCC737"),
        Color(hex: "F26B0F"),
        Color(hex: "F05A7E"),
        Color(hex: "E73879"),
        Color(hex: "EE66A6")
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack() {
                    
                    HStack{
                        Text("History Of Yoga 🪷 ")
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    
                    // Introduction Card
                    VStack(alignment: .leading) {
                        Text("Ancient Origins & Evolution")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                        
                        HStack {
                            Image("lotusPose")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                                .cornerRadius(10)
                                .padding(.leading)
                            
                            Text("The history of yoga spans thousands of years, representing a rich tapestry of spiritual and physical practices.")
                                .font(.title3)
                        }
                    }
                    .background(Color(.orange))
                    .cornerRadius(15)
                    .padding()
                    
                    VStack(spacing: 20) {
                        timelineSection(
                            title: "Ancient Beginnings",
                            period: "2700 BCE",
                            description: "Indus-Sarasvati Civilization: First archaeological evidence of yoga-like practices",
                            color: timelineColors[0]
                        )
                        
                        timelineSection(
                            title: "Vedic Period",
                            period: "1500-500 BCE",
                            description: "Yoga concepts start to appear in the ancient Vedas, particularly in the Rigveda, which contains references to ascetic practices.",
                            color: timelineColors[1]
                        )
                        
                        timelineSection(
                            title: "Upanishads",
                            period: "800 BCE-200 CE",
                            description: "These philosophical texts delve deeper into meditation, breath control, and spiritual liberation, emphasizing the inner journey.",
                            color: timelineColors[2]
                        )
                        
                        timelineSection(
                            title: "Bhagavad Gita",
                            period: "circa 500 BCE",
                            description: "This key scripture in Hindu philosophy describes various paths of yoga, including karma yoga (the yoga of action), bhakti yoga (the yoga of devotion), and jnana yoga (the yoga of knowledge).",
                            color: timelineColors[3]
                        )
                        
                        timelineSection(
                            title: "Patanjali's Yoga",
                            period: "circa 400 CE",
                            description: "This foundational text codifies the practice of yoga into an eight-limbed path (Ashtanga), includes ethical guidelines, physical postures (asanas), breath control (pranayama), and meditation",
                            color: timelineColors[4]
                        )
                        
                        timelineSection(
                            title: "Modern Era",
                            period: "20th Century-Present",
                            description: "Global spread and adaptation of yoga practices worldwide",
                            color: timelineColors[5]
                        )
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    private func timelineSection(title: String, period: String, description: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(period)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(description)
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [color.opacity(0.7), color.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
        .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

// Add Color extension for hex color support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    history()
}
