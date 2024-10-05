//
//  ListView2.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 26/08/24.
//

import SwiftUI

struct ListView: View {
   
   @State private var medicines: [Medicine] = loadJSONData()
   let searchResults: [String]
   
   var body: some View {
       NavigationStack {
           List(filteredMedicines.sorted(by: { $0.medicineName < $1.medicineName }), id: \.self) { medicine in
               NavigationLink(destination: DescriptionPage(medicine: medicine)) {
                   VStack(alignment: .leading) {
                       Text(medicine.medicineName)
                           .font(.headline)
                   }
               }
           }
       }
   }
   
   var filteredMedicines: [Medicine] {
       if searchResults.isEmpty {
           return medicines
       } else {
           return medicines.filter { medicine in
               searchResults.contains(medicine.medicineName)
           }
       }
   }
}

#Preview {
    ListView(searchResults: nameList)
}
