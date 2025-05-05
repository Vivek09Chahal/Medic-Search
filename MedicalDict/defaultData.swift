//
//  defaultMedicineData.swift
//  MedicalDict
//
//  Created by Vivek on 5/5/25.
//

import Foundation

class DefaultData {
    
    static let shared = DefaultData()
    
    private init() {}
    
    var data: Medicine = Medicine(/*Done*/medicineName: "Paracetamol",
                           /*Done*/description: "Paracetamol is a pain reliever and a fever reducer.",
                           /*Done*/uses: ["Allergy relief", "Hay fever", "Hives"],
                           /*Done*/sideEffects: ["Nausea", "Rash", "Liver damage (in overdose)"],
                           /*Done*/howToUse: "Take with water. Can be taken with or without food.",
                           /*Done*/precautions: ["Avoid in liver disease", "Consult doctor if pregnant"],
                           interactions: ["Alcohol", "Warfarin"],
                           storageInstructions: "Store at room temperature, away from moisture and heat.",
                           warnings: "Do not exceed 4g per day. Overdose can lead to severe liver damage.")
}
