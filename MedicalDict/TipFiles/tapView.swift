import SwiftUI

struct tapView: View {
    
    var tips: String
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack{
            Color.red.opacity(0.6)
            VStack{
                
                ZStack{
                    Image("descriptionImage")
                        .resizable()
                        .frame(height: 300)
                    
                    HStack{
                        Button(){
                            withAnimation(.easeOut(duration: 0.7)){
                                isVisible = false
                            }
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.bar)
                                Text("X")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .offset(x: 220, y: -100)
                }
                Text(tips)
                    .font(.system(size: 50))
                    .padding()
                Spacer()
            }
        }
        .frame(width: 550, height: 700)
        .cornerRadius(30.0)
    }
}

#Preview {
    tapView(tips: "Stay Hydrated: Proper hydration helps maintain energy levels, supports digestion, and promotes healthy skin.", isVisible: .constant(true))
}
