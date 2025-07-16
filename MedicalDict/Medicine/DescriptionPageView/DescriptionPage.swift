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
                HStack {
                    Text(medicine.medicineName)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                .backGround()
                
                // Description
                stringView(title: "Description",
                           summary: medicine.description,
                           imageString: "stethoscope",
                           color: .blue)
                
                // Grid layout for main sections
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 15),
                    GridItem(.flexible(), spacing: 15)
                ], spacing: 15) {
                    listView(arrayData: medicine.uses,
                             section: "Usage",
                             icon: "cross.case",
                             color: Color(red: 0.2, green: 0.7, blue: 0.3))
                
                
                    listView(arrayData: medicine.precautions,
                             section: "Prec?ion",
                             icon: "exclamationmark.shield",
                             color: .orange)
                
                
                
                    listView(arrayData: medicine.interactions,
                             section: "Interct",
                             icon: "pills.circle",
                             color: Color(red: 0.8, green: 0.2, blue: 0.2))
                
                
                    listView(arrayData: medicine.sideEffects,
                             section: "Effect",
                             icon: "staroflife.shield",
                             color: Color(red: 0.9, green: 0.3, blue: 0.3))
                }
                
                // Bottom sections
                stringView(title: "Use",
                           summary: medicine.howToUse,
                           imageString: "shield.lefthalf.filled.badge.checkmark",
                           color: Color(red: 0.2, green: 0.5, blue: 0.8))
                
                stringView(title: "Instruction",
                           summary: medicine.storageInstructions,
                           imageString: "shippingbox.fill",
                           color: Color(red: 0.4, green: 0.4, blue: 0.8))
                
                stringView(title: "Warning",
                           summary: medicine.warnings,
                           imageString: "exclamationmark.triangle.fill",
                           color: Color(red: 0.9, green: 0.6, blue: 0.2))
            }
            .padding(.horizontal)
        }
        .linearBackground()
    }
}

// Preview
#Preview {
    DescriptionPage(medicine: DefaultData.shared.data)
}
