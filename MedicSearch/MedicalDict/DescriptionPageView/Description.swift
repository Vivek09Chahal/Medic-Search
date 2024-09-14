//
//  Description.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 03/09/24.
//

import SwiftUI

struct Description: View {
    
    @State var description: String
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                HStack(){
                    Image(systemName: "list.clipboard")
                        .foregroundStyle(.blue)
                    Text("Description")
                        .font(.title2)
                }
                .padding(3)
                Text(description)
            }
        }
    }
}
#Preview {
    Description(description: "Vivek")
}
