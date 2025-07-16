import SwiftUI
import UserNotifications

struct DrugEditor: View {
    @State private var selectedColor: Color = .white
    @Binding var drug: Drug
    @State var isNew = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header Section
                headerSection
                quantitySection
                colorSection
                scheduleSection
                notificationSection
                
                // Dose Schedule
                if !drug.doses.isEmpty {
                    GroupBox(label: Text("Dose Schedule").fontWeight(.medium)) {
                        ForEach($drug.doses.indices, id: \.self) { index in
                            DoseRow(dose: $drug.doses[index])
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
            .padding()
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Notification Permission"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            self.selectedColor = Color(drug.color)
        }
    }
}

struct ColorButton: View {
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 40, height: 40)
                    .shadow(radius: isSelected ? 3 : 0)
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                }
            }
        }
    }
}

#Preview {
    DrugEditor(drug: .constant(Drug()), isNew: true)
        .environmentObject(DrugData())
}

extension DrugEditor{
    
    var headerSection: some View {
        HStack {
            TextField("Medicine Name", text: $drug.title)
                .font(.system(size: 24, weight: .bold))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Circle()
                .fill(Color(drug.color))
                .frame(width: 30, height: 30)
                .padding(.leading)
        }
        .padding()
    }
    
    var quantitySection: some View {
        GroupBox(label: Text("Basic Information").fontWeight(.medium)) {
            HStack(spacing: 12) {
                Picker("Type", selection: $drug.drugType) {
                    ForEach(DrugType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                
                TextField("Quantity", text: $drug.quantity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.vertical, 8)
        }

    }
    
    var colorSection: some View {
        GroupBox(label: Text("Color Tag").fontWeight(.medium)) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 12) {
                ForEach(ColorOptions.all, id: \.self) { colorOption in
                    ColorButton(color: colorOption, isSelected: selectedColor == colorOption) {
                        selectedColor = colorOption
                        drug.color = colorOption.rgbaColor
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
    
    var scheduleSection: some View {
        GroupBox(label: Text("Schedule").fontWeight(.medium)) {
            VStack(spacing: 12) {
                DatePicker("Start Date", selection: $drug.startDate, displayedComponents: [.date])
                    .datePickerStyle(CompactDatePickerStyle())
                
                HStack{
                    Picker("Frequency", selection: $drug.frequency) {
                        ForEach(Frequency.allCases, id: \.self) { frequency in
                            Text(frequency.rawValue)
                                .tag(frequency)
                        }
                    }
                    
                    Picker("Duration", selection: $drug.duration) {
                        ForEach(Duration.allCases, id: \.self) { duration in
                            Text(duration.rawValue)
                                .tag(duration)
                        }
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
    
    var notificationSection: some View {
        GroupBox(label: Text("Notifications").fontWeight(.medium)) {
            Toggle("Enable Reminders", isOn: $drug.notificationsEnabled)
                .onChange(of: drug.notificationsEnabled) { oldValue, newValue in
                    handleNotificationToggle(newValue)
                }
        }
    }
    
    private func handleNotificationToggle(_ isEnabled: Bool) {
        if isEnabled {
            NotificationManager.shared.requestAuthorization { granted in
                DispatchQueue.main.async {
                    if granted {
                        NotificationManager.shared.scheduleNotifications(for: drug)
                    } else {
                        self.drug.notificationsEnabled = false
                        self.alertMessage = "Please enable notifications in Settings to receive medicine reminders."
                        self.showingAlert = true
                    }
                }
            }
        } else {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }

}
