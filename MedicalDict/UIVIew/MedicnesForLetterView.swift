import SwiftUI

struct MedicinesForLetterView: View {
    var letter: Character
    var medicines: [Medicine]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.05), .white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            List(medicines, id: \.medicineName) { med in
                NavigationLink(destination: DescriptionPage(medicine: med)) {
                    Text(med.medicineName)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Medicines - \(letter)")
        }
    }
}
