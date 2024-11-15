import SwiftUI

struct TipBarView: View {
    @State private var length = DailyTips.tips.count
    @State private var selectedIndex: Int? = nil
    @State private var isTapViewVisible: Bool = false
    @State private var animateBackground = false
    @State private var currentIndex = 0
    @State private var rotation: Double = 0
    
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Animated background
            Image("descriptionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color("AccentColor").opacity(0.6),
                            Color.purple.opacity(0.3),
                            Color.blue.opacity(0.4)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .scaleEffect(animateBackground ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 20).repeatForever(autoreverses: true), value: animateBackground)
            
            VStack(spacing: 40) {
                Text("Wellness Tips")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .foregroundStyle(.linearGradient(colors: [.white, .blue.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .white.opacity(0.3), radius: 10)
                
                // Animated Tips Carousel
                TabView(selection: $currentIndex) {
                    ForEach(0..<length, id: \.self) { index in
                        TipCard(tip: DailyTips.tips[index])
                            .padding(.horizontal)
                            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: 800, height: 400)
                
//                 Custom Page Indicator
                HStack(spacing: 12) {
                    ForEach(max(0, currentIndex - 2)...min(length - 1, currentIndex + 2), id: \.self) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.white, .blue.opacity(0.6)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 8, height: 8)
                            .scaleEffect(currentIndex == index ? 1.5 : 1.0)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentIndex)
                            .onTapGesture {
                                withAnimation {
                                    currentIndex = index
                                }
                            }
                    }
                }
                .padding(.vertical, 20)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.15))
                        .blur(radius: 5)
                )
                .padding(.horizontal, 20)
            }
            .onReceive(timer) { _ in
                withAnimation(.easeInOut) {
                    currentIndex = (currentIndex + 1) % length
                }
            }
        }
    }
}

#Preview {
    TipBarView()
}
