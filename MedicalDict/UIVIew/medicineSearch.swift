//
//  sideBarView.swift
//  MedicalDict
//
//  Created by Vivek on 04/10/24.
//

import SwiftUI

struct mainView: View {
    @State private var medicines: [Medicine] = loadMedicineJSONData()
    @State var searchText: String = ""
    @State private var searchIsActive = false
    @State var selectedMedicine: Medicine?
    
    var filteredMedicines: [Medicine] {
        if searchText.isEmpty {
            return []
        }
        return medicines.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Background Image
                Image("description")
                    .resizable()
                    .blur(radius: 10)
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                // Search Bar
                VStack() {
                    
                    Text("Medicine Search")
                        .font(.title)
                        .padding()
                    
                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                                .padding(.leading, 12)
                            
                            TextField("Search medicines...", text: $searchText)
                                .foregroundStyle(.black)
                                .autocapitalization(.none)
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.black)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .frame(maxWidth: 400)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.1), radius: 8)
                        )
                        .ignoresSafeArea()
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Search Results
                    if !searchText.isEmpty {
                        onSearchView(searchText: searchText, medicines: medicines)
                    } else {
                        alphabeticView(medicines: medicines)
                    }
                }
            }
        }
    }
}

#Preview {
    mainView()
}
