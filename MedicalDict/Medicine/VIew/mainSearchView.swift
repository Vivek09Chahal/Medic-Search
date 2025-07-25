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
    
    
    var body: some View {
        
        NavigationStack {
            VStack{
                // Search Bar
                Text("Medicine Dictionary")
                    .font(.title)
                    .padding()
                searchView()
                ScrollView{
                    VStack() {
                        // Search Results
                        if !searchText.isEmpty {
                            onSearchView(searchText: searchText, medicines: medicines)
                        } else {
                            alphabeticView(medicines: medicines)
                        }
                    }
                }
            }
            .linearBackground()
        }
    }
}

#Preview {
    mainView()
}

extension mainView {
    
    func searchView() -> some View {
        HStack(alignment: .center) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                
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
                            .padding(.horizontal)
                    }
                }
            }
            .frame(width: 400)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.1), radius: 8)
                    .padding(.horizontal)
            )
            .ignoresSafeArea()
        }
    }
    
}
