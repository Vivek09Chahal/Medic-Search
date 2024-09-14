//
//  ListView2.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 26/08/24.
//

import SwiftUI

struct ListView: View {
    
    @State private var medicines: [Medicine] = loadJSONData()
    
    var body: some View {
        NavigationStack{
            List(medicines) { medicine in
                NavigationLink(destination: DescriptionPage(medicine: medicine)){
                    VStack(alignment: .leading) {
                        Text(medicine.medicineName)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
