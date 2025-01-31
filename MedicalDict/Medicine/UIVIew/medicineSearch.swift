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
    @FocusState private var isFocused: Bool
    
    var filteredMedicines: [Medicine] {
        if searchText.isEmpty {
            return []
        }
        return medicines.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        
        NavigationStack {
            // Search Bar
            ScrollView{
                VStack() {
                    
                    Text("Medicine Dictionary")
                        .font(.title)
                        .padding()
                    
                    HStack(alignment: .center) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                                .padding(.leading, 12)
                            
                            TextField("Search medicines...", text: $searchText)
                                .foregroundStyle(.green)
                                .autocapitalization(.none)
                                .keyboardType(.alphabet)
                                .focused($isFocused)
                                .onTapGesture {
                                    isFocused = true  // Explicitly show keyboard
                                }
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.black)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .frame(width: 400)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.1), radius: 8)
                        )
                        .ignoresSafeArea()
                    }
                    
                    // Search Results
                    if !searchText.isEmpty {
                        onSearchView(searchText: searchText, medicines: medicines)
                    } else {
                        alphabeticView(medicines: medicines)
                    }
                }
            }
            .background{
                LinearGradient(
                    colors: [
                        Color(red: 0.88, green: 0.37, blue: 0.64),
                        Color(red: 0.83, green: 0.37, blue: 0.17)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
            }
        }
    }
}

#Preview {
    mainView()
}
