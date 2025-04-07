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
    
    var body: some View {
            LazyVStack(spacing: 10) {
                ForEach(filteredMedicines) { medicine in
                    NavigationLink(destination: DescriptionPage(medicine: medicine)) {
                        HStack {
                            Text(medicine.medicineName)
                                .foregroundStyle(.primary)
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.secondarySystemBackground))
                                        .shadow(color: .black.opacity(0.05), radius: 4)
                                )
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea()
    }
    
    var filteredMedicines: [Medicine] {
        if searchText.isEmpty {
            return []
        }
        return medicines.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
    }
}
