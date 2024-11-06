//
//  StringView.swift
//  MedicalDict
//
//  Created by Vivek on 10/10/24.
//

import SwiftUI

struct StringView: View {
    
    @State var title: String
    @State var summary: String
    @State var imageString : String
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                HStack(){
                    Image(systemName: imageString)
                        .foregroundStyle(.yellow)
                    Text(title)
                        .font(.title2)
                }
                .padding(3)
                Divider()
                Text(summary)
                    .font(.title3)
            }
        }
    }
}
#Preview {
    StringView(title: "Vivek", summary: "Hi I am Vivek", imageString: "person")
}
