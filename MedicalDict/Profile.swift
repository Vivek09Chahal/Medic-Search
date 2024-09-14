//
//  Profile.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/08/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var name: String
    
    var body: some View {
        VStack{
            Image("1")
                .resizable()
                .frame( width: 100 ,height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 10)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
            
            Spacer()
            
            TextField("User Name", text: $name)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
