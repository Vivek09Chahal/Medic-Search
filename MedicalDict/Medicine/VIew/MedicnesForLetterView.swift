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
            .linearBackground()
    }
}



#Preview {
    MedicinesForLetterView(letter: "A", medicines: [DefaultData.shared.data])
}
