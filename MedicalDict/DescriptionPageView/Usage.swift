//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

struct Usage: View {
    
    @State var usageData: [String]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                ForEach(usageData, id: \.self) {
                    name in Text("•\(name)")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    Usage(usageData: ["gsdcb", "jdcuy"])
}
