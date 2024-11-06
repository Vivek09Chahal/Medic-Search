import SwiftUI

struct TipBarView: View {
    
    @State private var length = DailyTips.tips.count
    @State private var selectedIndex: Int? = nil
    @State private var isTapViewVisible: Bool = false
    
    private let columns = [GridItem(.fixed(400)), GridItem(.fixed(400))]
    
    var body: some View {
        ZStack {
            Image("descriptionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                Text("Tips To Keep Yourself Healthy")
                    .font(.title)
                    .fontDesign(.monospaced)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<length, id: \.self) { index in
                        TipImageButton(
                            index: index,
                            selectedIndex: $selectedIndex,
                            isTapViewVisible: $isTapViewVisible
                        )
                    }
                }
            }
            .blur(radius: isTapViewVisible ? 10 : 0) // Apply blur based on visibility
            
            if let selectedIndex = selectedIndex, isTapViewVisible {
                tapView(tips: DailyTips.tips[selectedIndex], isVisible: $isTapViewVisible)
            }
        }
    }
}

#Preview {
    TipBarView()
}
