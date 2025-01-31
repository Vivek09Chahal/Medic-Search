//
//  Usage.swift
//  MedicalDict
//
//  Created by Vivek on 27/08/24.
//

import SwiftUI

func listView(arrayData: [String], section: String, icon: String, color: Color) -> some View {
    VStack(alignment: .leading) {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(color)
            
            Text(section)
                .font(.title)
        }
        .padding()
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(arrayData, id: \.self) { data in
                    Text("→ " + data)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal)
        }
    }
}
