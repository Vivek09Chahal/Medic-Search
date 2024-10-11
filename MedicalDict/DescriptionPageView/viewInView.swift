//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

struct viewInView: View {
    
    @State var arrayData: [String]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                ForEach(arrayData, id: \.self) {
                    name in Text("•\(name)")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    viewInView(arrayData: ["gsdcb", "jdcuy"])
}
