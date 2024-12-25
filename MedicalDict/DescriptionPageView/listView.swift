//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

func listView( arrayData: [String],section: String, icon: String ) -> some View{
    ScrollView(showsIndicators: false){
        VStack(alignment: .leading){
            HStack(){
                Image(systemName: icon)
                    .foregroundStyle(.yellow)
                Text(section)
                    .font(.title2)
            }
            .padding(3)
            ForEach(arrayData, id: \.self) {
                name in Text("・\(name)")
                    .font(.title3)
            }
        }
        .padding(3)
    }

}
