import SwiftUI

struct MedicinesForLetterView: View {
    var letter: Character
    var medicines: [Medicine]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red.opacity(0.5), .pearl]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(medicines, id: \.medicineName) { med in
                        NavigationLink(destination: DescriptionPage(medicine: med)) {
                            MedicineCardView(medicine: med)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Medicines - \(letter)")
        }
    }
}

struct MedicineCardView: View {
    let medicine: Medicine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(medicine.medicineName)
                .foregroundStyle(.black)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(medicine.description)
                    .foregroundStyle(.black)
                    .font(.title2)
                    .lineLimit(2)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.pearl)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
        )
    }
}
