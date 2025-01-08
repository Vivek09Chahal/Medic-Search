//
//  DescritpionPage.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 13/08/24.
//

import SwiftUI

struct DescriptionPage: View {
    
    @State var medicine: Medicine
    
    var body: some View {
        ZStack{
            
            Image("description")
                .resizable()
                .blur(radius: 5)
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    ZStack{
                        HStack{
                            Image(systemName: "pills.fill")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .padding()
                            
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            Text("\(medicine.medicineName) ")
                                .font(.system(size: 50))
                        }
                        .padding(7)
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(45)
                    
                    blockView(height: 150) {
                        stringView(title: "Description", summary: medicine.description, imageString: "stethoscope", color: .blue)
                            .frame(height: 150)
                            .padding(.leading)
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            blockView(height: 250, width: 295) {
                                listView(arrayData: medicine.uses, section:"Usage" ,icon:"cross.case", color: Color(red: 0.2, green: 0.7, blue: 0.3))
                                    .frame(width: 250, height: 250)
                            }
                            
                            blockView(height: 250, width: 295) {
                                listView(arrayData: medicine.precautions, section:"Precautions", icon:"exclamationmark.shield", color: .orange)
                                    .frame(width: 250, height: 250)
                            }
                        }
                        
                        HStack{
                            blockView(height: 250, width: 295) {
                                listView(arrayData: medicine.interactions, section:"Interaction", icon:"pills.circle", color: Color(red: 0.8, green: 0.2, blue: 0.2))
                                    .frame(width: 250, height: 250)
                            }
                            
                            blockView(height: 250, width: 295) {
                                listView(arrayData: medicine.sideEffects, section: "Side effects", icon: "staroflife.shield", color: Color(red: 0.9, green: 0.3, blue: 0.3))
                                    .frame(width: 250, height: 250)
                            }
                        }
                    }
                }
                
                blockView(alignment: .topLeading, height: 150) {
                    stringView(title: "How To Use", summary: medicine.howToUse, imageString: "shield.lefthalf.filled.badge.checkmark", color: Color(red: 0.2, green: 0.5, blue: 0.8))
                        .frame(height: 150)
                        .padding(.leading)
                }
                
                Spacer()
                blockView(height: 150) {
                    stringView(title: "Storage Instruction", summary: medicine.storageInstructions, imageString: "shippingbox.fill", color: Color(red: 0.4, green: 0.4, blue: 0.8))
                        .frame(height: 150)
                        .padding(.leading)
                }
                
                blockView(height: 150) {
                    stringView(title: "Warning", summary: medicine.warnings, imageString: "exclamationmark.triangle.fill", color: Color(red: 0.9, green: 0.6, blue: 0.2))
                        .frame(height: 150)
                        .padding(.leading)
                }
            }
//            .scaleEffect(1)
            .frame(width: 600)
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

private func blockView(alignment: Alignment = .leading, height: CGFloat, width: CGFloat = .infinity, @ViewBuilder content: () -> some View) -> some View {
    content()
        .frame(width: width, height: height, alignment: alignment)
        .background(
            RoundedRectangle(cornerRadius: 45.0)
                .foregroundStyle(.ultraThinMaterial)
        )
}
