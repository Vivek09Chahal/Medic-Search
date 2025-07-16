//
//  medicineCardView.swift
//  MedicalDict
//
//  Created by Vivek on 5/5/25.
//

import SwiftUI

struct MedicineCardView: View {
    
    let medicine: Medicine
    
    var body: some View {
        VStack(spacing: 8) {
            Text(medicine.medicineName)
                .foregroundStyle(.primary)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack() {
                Text(medicine.description)
                    .foregroundStyle(.primary)
                    .font(.title2)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.primary)
            }
        }
        .padding()
        .backGround()
    }
}

#Preview {
    MedicineCardView(medicine: DefaultData.shared.data)
}
