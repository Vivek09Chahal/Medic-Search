//
//  sideBarView.swift
//  MedicalDict
//
//  Created by Vivek on 04/10/24.
//

import SwiftUI

struct mainView: View {
    
    @State private var medicines: [Medicine] = loadMedicineJSONData()
    @State private var searchText: String = ""
    @State private var searchIsActive = false
    @State var selectedMedicine: Medicine? // Selected medicine state
    
    var body: some View {
        NavigationSplitView {
            // Master view
            NavigationStack {
                List(filteredMedicines.sorted(by: { $0.medicineName < $1.medicineName }), id: \.self) { medicine in
                    Button("\(medicine.medicineName)") {
                        selectedMedicine = medicine // Assign the entire medicine object
                    }
                }
            }
            .navigationSplitViewColumnWidth(250)
            // Detail view
        } detail: {
            if let selectedMedicine = selectedMedicine {
                DescriptionPage(medicine: selectedMedicine)
                    .id(selectedMedicine.medicineName) // Force the detail view to refresh on each selection // Pass the selected medicine to the detail view
            } else {
                Text("To ensure good health:")
                Text("Eat lightly, breathe deeply, live moderately, cultivate cheerfulness")
                Text("And maintain an interest in life.")
                Text("To know about any medicine, Search in Sidebar")
            }
        }
        .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search Here")
    }
    
    // Filtered medicines based on search text
    var filteredMedicines: [Medicine] {
        if searchResults.isEmpty {
            return medicines
        } else {
            return medicines.filter { medicine in
                searchResults.contains(medicine.medicineName)
            }
        }
    }
    
    // Search results based on search text
    var searchResults: [String] {
        if searchText.isEmpty {
            return medicines.map { $0.medicineName }
        } else {
            return medicines.map { $0.medicineName }.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    mainView()
}
