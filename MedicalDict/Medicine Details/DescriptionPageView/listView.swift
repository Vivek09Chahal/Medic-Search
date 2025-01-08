//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

func listView( arrayData: [String],section: String, icon: String, color: Color ) -> some View{
    ScrollView(showsIndicators: false){
        VStack(alignment: .leading){
            HStack(){
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height:30)
                    .foregroundStyle(color)
                Text(section)
                    .font(.title)
                    .padding(5)
                    
            }
            .padding(3)
            ForEach(arrayData, id: \.self) {
                name in Text("・\(name)")
                    .font(.title2)
            }
        }
        .padding(3)
    }

}
