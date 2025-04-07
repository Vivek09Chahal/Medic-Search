import SwiftUI

struct popUpAnimation: View {
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("🎉 Congratulations! 🎉")
                        .font(.title)
                        .bold()
                    
                    Text("🎊 🎯 🌟")
                        .font(.system(size: 40))
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(radius: 10)
                )
                .offset(y: isShowing ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isShowing)
            }
        }
        .onAppear {
            isShowing = true
        }
    }
}

#Preview {
    popUpAnimation()
        .preferredColorScheme(.dark)
}
