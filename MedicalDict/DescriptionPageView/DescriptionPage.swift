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
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    ZStack{
                        HStack{
                            Image(systemName: "pills.fill")
                                .resizable()
                                .frame(width: 50, height: 40)
                                .padding()
                            
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            Text("\(medicine.medicineName) ")
                                .font(.system(size: 50))
                        }
                        .padding(7)
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    
                    blockView(height: 150) {
                        stringView(title: "Description", summary: medicine.description, imageString: "stethoscope")
                            .frame(height: 150)
                            .padding(.leading)
                    }
                    
                    blockView(alignment: .center, height: 200) {
                        HStack{
                            listView(arrayData: medicine.uses, section:"Usage" ,icon:"cross.case")
                                .frame(width: 165)
                            Capsule().fill(Color.secondary).frame(width: 2.0)
                            
                            listView(arrayData: medicine.precautions, section:"Precautions", icon:"exclamationmark.shield")
                                .frame(width: 165)
                            Capsule().fill(Color.secondary).frame(width: 2.0)
                            
                            listView(arrayData: medicine.interactions, section:"Interaction", icon:"pills.circle")
                                .frame(width: 165)
                        }
                    }
                }
                
                blockView(alignment: .topLeading, height: 150) {
                    stringView(title: "How To Use", summary: medicine.howToUse, imageString: "shield.lefthalf.filled.badge.checkmark")
                        .frame(height: 150)
                        .padding(.leading)
                }
                
                Spacer()
                
                blockView(alignment: .topLeading, height: 150) {
                    listView(arrayData: medicine.sideEffects, section: "Side effects", icon: "staroflife.shield")
                        .frame(height: 150)
                        .padding(.leading)
                }
                
                blockView(height: 150) {
                    stringView(title: "Storage Instruction", summary: medicine.storageInstructions, imageString: "shippingbox.fill")
                        .frame(height: 150)
                        .padding(.leading)
                }
                
                blockView(height: 150) {
                    stringView(title: "Warning", summary: medicine.warnings, imageString: "exclamationmark.triangle.fill")
                        .frame(height: 150)
                        .padding(.leading)
                }
            }
            .scaleEffect(1)
            .frame(width: 600)
            .cornerRadius(25.0)
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


struct ExtractView: View{
    
    //    var foregroundStyle: any ShapeStyle
    var height: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View{
        
        Rectangle()
            .foregroundStyle(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .frame(height: height)
    }
}

private func blockView(alignment: Alignment = .leading, height: CGFloat, @ViewBuilder content: () -> some View) -> some View {
    ZStack(alignment: alignment) {
        ExtractView(height: height, cornerRadius: 25.0)
        content()
    }
}
