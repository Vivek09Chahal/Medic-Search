//
//  DescritpionPage.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 13/08/24.
//

import SwiftUI

struct DescriptionPage: View {
    var medicine: Medicine
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Header
                ZStack {
                    HStack {
                        Text(medicine.medicineName)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.top)
                
                // Description
                blockView(height: 120) {
                    stringView(title: "Description",
                               summary: medicine.description,
                               imageString: "stethoscope",
                               color: .blue)
                    .padding(.horizontal)
                }
                
                // Grid layout for main sections
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 15),
                    GridItem(.flexible(), spacing: 15)
                ], spacing: 15) {
                    blockView(height: 220) {
                        listView(arrayData: medicine.uses,
                                 section: "Usage",
                                 icon: "cross.case",
                                 color: Color(red: 0.2, green: 0.7, blue: 0.3))
                    }
                    
                    blockView(height: 220) {
                        listView(arrayData: medicine.precautions,
                                 section: "Precautions",
                                 icon: "exclamationmark.shield",
                                 color: .orange)
                    }
                    
                    blockView(height: 220) {
                        listView(arrayData: medicine.interactions,
                                 section: "Interaction",
                                 icon: "pills.circle",
                                 color: Color(red: 0.8, green: 0.2, blue: 0.2))
                    }
                    
                    blockView(height: 220) {
                        listView(arrayData: medicine.sideEffects,
                                 section: "Side effects",
                                 icon: "staroflife.shield",
                                 color: Color(red: 0.9, green: 0.3, blue: 0.3))
                    }
                }
                
                // Bottom sections
                blockView(height: 120) {
                    stringView(title: "How To Use",
                               summary: medicine.howToUse,
                               imageString: "shield.lefthalf.filled.badge.checkmark",
                               color: Color(red: 0.2, green: 0.5, blue: 0.8))
                    .padding(.horizontal)
                }
                
                blockView(height: 120) {
                    stringView(title: "Storage Instruction",
                               summary: medicine.storageInstructions,
                               imageString: "shippingbox.fill",
                               color: Color(red: 0.4, green: 0.4, blue: 0.8))
                    .padding(.horizontal)
                }
                
                blockView(height: 120) {
                    stringView(title: "Warning",
                               summary: medicine.warnings,
                               imageString: "exclamationmark.triangle.fill",
                               color: Color(red: 0.9, green: 0.6, blue: 0.2))
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
        }
        .background {
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

// Preview
#Preview {
    DescriptionPage(medicine: Medicine(/*Done*/medicineName: "Paracetamol",
                                               /*Done*/description: "Paracetamol is a pain reliever and a fever reducer.",
                                               /*Done*/uses: ["Allergy relief", "Hay fever", "Hives"],
                                               /*Done*/sideEffects: ["Nausea", "Rash", "Liver damage (in overdose)"],
                                               /*Done*/howToUse: "Take with water. Can be taken with or without food.",
                                               /*Done*/precautions: ["Avoid in liver disease", "Consult doctor if pregnant"],
                                               interactions: ["Alcohol", "Warfarin"],
                                               storageInstructions: "Store at room temperature, away from moisture and heat.",
                                               warnings: "Do not exceed 4g per day. Overdose can lead to severe liver damage."))
}

private func blockView(height: CGFloat, @ViewBuilder content: () -> some View) -> some View {
    content()
        .frame(maxWidth: .infinity, minHeight: height)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.thinMaterial)
        )
}
