import SwiftUI

struct MedicinesForLetterView: View {
    var letter: Character
    var medicines: [Medicine]
    
    var body: some View {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(medicines, id: \.medicineName) { med in
                        NavigationLink{
                            DescriptionPage(medicine: med)
                                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                        }label: {
                            MedicineCardView(medicine: med)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("\(letter)")
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .background{
                LinearGradient(
                    colors: [
                        Color(red: 0.88, green: 0.27, blue: 0.44),
                        Color(red: 0.83, green: 0.47, blue: 0.10)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
            }
    }
}

struct MedicineCardView: View {
    let medicine: Medicine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(medicine.medicineName)
                .foregroundStyle(.primary)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(medicine.description)
                    .foregroundStyle(.primary)
                    .font(.title2)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.primary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                colors: [.white.opacity(0.5), .clear],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
}

#Preview {
    MedicineCardView(medicine: .init(id: UUID(), medicineName: "Medicine Name", description: "Description", uses: [], sideEffects: [], howToUse: "", precautions: [], interactions: [], storageInstructions: "", warnings: ""))
}
