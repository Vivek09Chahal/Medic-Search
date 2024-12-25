//
//  onSearchView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 12/25/24.
//

import SwiftUI

struct onSearchView: View {
    
    var searchText: String
    var medicines: [Medicine]
    
    var filteredMedicines: [Medicine] {
        if searchText.isEmpty {
            return []
        }
        return medicines.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(filteredMedicines) { medicine in
                    NavigationLink(destination: DescriptionPage(medicine: medicine)) {
                        HStack {
                            Text(medicine.medicineName)
                                .foregroundStyle(.primary)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.05), radius: 4)
                                )
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
