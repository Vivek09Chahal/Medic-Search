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
            
            Image("descriptionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    Image("img")
                        .resizable()
                        .frame(height: 300)
                    
                    ZStack{
                        HStack{
                            Image(systemName: "pills.fill")
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            Text("\(medicine.medicineName) ")
                                .font(.title)
                                .foregroundStyle(.black)
                        }
                        .padding(7)
                    }
                    .background(.white)
                    .cornerRadius(35)
                    .offset(x: 0, y:-35)
                    
                    ZStack(alignment: .leading){
                        ExtractView(width: 0.0, height: 100, cornerRadius: 25.0)
                        StringView(title: "Description", summary: medicine.description, imageString: "stethoscope")
                            .frame(height: 100)
                            .padding(.leading)
                    }
                    .padding(.horizontal, 2)
                    
                    ZStack{
                        ExtractView(width: 0.0, height: 150, cornerRadius: 25.0)
                        HStack{
                            //                      Usage
                            VStack{
                                Section("Usage"){
                                    viewInView(arrayData: medicine.uses)
                                        .frame(width: 165, height: 100)
                                    //                                    .padding(.leading)
                                }
                            }
                            Capsule().fill(Color.secondary).frame(width: 2.0)
                            
                            //                      Precautions
                            VStack{
                                Section("Precautions"){
                                    viewInView(arrayData: medicine.precautions)
                                        .frame(width: 165, height: 100)
                                    //                                    .padding(.leading)
                                }
                            }
                            Capsule().fill(Color.secondary).frame(width: 2.0)
                            
                            //                      Interactions
                            VStack{
                                Section("Interaction"){
                                    viewInView(arrayData: medicine.interactions)
                                        .frame(width: 165, height: 100)
                                    //                                    .padding(.leading)
                                }
                            }
                        }
                    }
                }
                
                
                // How To Use
                ZStack(alignment: .topLeading){
                    ExtractView(width: 0.0, height: 100, cornerRadius: 25.0)
                    StringView(title: "How To Use", summary: medicine.howToUse, imageString: "checkmark.seal.fill")
                        .frame(height: 100)
                        .padding(.leading)
                }
                .padding(2)
                
                Spacer()
                
//              Side Effect
                ZStack(alignment: .topLeading){
                    ExtractView(width: 0.0, height: 150, cornerRadius: 25.0)
                    sideEffect(sideEffectData: medicine.sideEffects)
                        .frame(height: 150)
                        .padding(.leading)
                }
                .padding(2)
                
//              Storage instructions
                ZStack(alignment: .leading){
                    ExtractView(width: 0.0, height: 100, cornerRadius: 25.0)
                    StringView(title: "Storage Instruction", summary: medicine.storageInstructions, imageString: "shippingbox.fill")
                        .frame(height: 100)
                        .padding(.leading)
                }
                .padding(.horizontal, 2)
                
//              Warning
                ZStack(alignment: .leading){
                    ExtractView(width: 0.0, height: 100, cornerRadius: 25.0)
                    StringView(title: "Warning", summary: medicine.warnings, imageString: "exclamationmark.triangle.fill")
                        .frame(height: 100)
                        .padding(.leading)
                }
                .padding(.horizontal, 2)
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
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View{
        
        Rectangle()
            .foregroundStyle(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .frame(height: height)
    }
}
