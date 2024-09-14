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
        ScrollView(showsIndicators: false){
            VStack(alignment: .center){
                Image(medicine.medicineName)
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
                    Description(description: medicine.description)
                        .frame(height: 100)
                        .padding(5)
                }
                .padding(.horizontal, 2)
                
                HStack{
                    // Usage
                    VStack{
                        Section("Usage"){
                            Usage(usageData: medicine.uses)
                                .frame(width: 165, height: 100)
                                .padding(.leading)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.thinMaterial)
                            .shadow(radius: 5)
                    )
                    
                    /*Spacer*/                    Spacer()
                    
                    // Precautions
                    VStack{
                        Section("Precautions"){
                            Precautions(PrecData: medicine.precautions)
                                .frame(width: 165, height: 100)
                                .padding(.leading)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.thinMaterial)
                            .shadow(radius: 5)
                    )
                }
                .padding(2)
            }
            
            // Way To Use
            ZStack(alignment: .topLeading){
                ExtractView(width: 0.0, height: 100, cornerRadius: 25.0)
                HowToUseView(howToUseData: medicine.howToUse)
                    .frame(height: 100)
                    .padding(.leading)
            }
            .padding(2)
            
            Spacer()
            
            // Side Effect
            ZStack(alignment: .topLeading){
                ExtractView(width: 0.0, height: 130, cornerRadius: 25.0)
                sideEffect(sideEffectData: medicine.sideEffects)
                    .frame(height: 130)
                    .padding(.leading)
            }
            .padding(2)
        }
        
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
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
