//
//  descriptionView.swift
//  MedicalDict
//
//  Created by Vivek Chahal on 1/9/25.
//

import SwiftUI

struct descriptionView: View {
    
    var list = ["stethoscope", "cross.case", "exclamationmark.shield", "pills.circle"]
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Search medicines...", text: $searchText)
                .foregroundStyle(.green)
                .keyboardType(.default) // Standard keyboard
                .textInputAutocapitalization(.none) // Disable auto-capitalization
                .disableAutocorrection(true) // Disable auto-correction
                .padding()
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    descriptionView()
}
