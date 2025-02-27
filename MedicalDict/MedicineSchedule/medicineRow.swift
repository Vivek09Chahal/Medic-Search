import SwiftUI

struct DrugRow: View {
    
    @ScaledMetric var imageWidth: CGFloat = 40
    var drug: Drug
    
    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text(drug.title)
                        .fontWeight(.bold)
                        .font(.headline)
                    
                    // Display the next dose time
                    if let nextDoseTime = drug.doses.first(where: { !$0.taken && $0.time > Date() })?.time {
                        Text("Next dose: " + nextDoseTime.formatted(date: .abbreviated, time: .shortened))
                            .font(.body)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("All doses completed")
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
            } icon: {
                Image(systemName: drug.symbol)
                    .font(.title2)
                    .foregroundStyle(Color(drug.color))
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
        }
    }
}

struct CustomLabelStyle: LabelStyle {
    @ScaledMetric private var iconWidth: Double = 40
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.icon
                .imageScale(.large)
                .frame(width: iconWidth)
            configuration.title
        }
    }
}


#Preview{
    DrugRow(drug: Drug.example) // Create a binding with .constant
}
