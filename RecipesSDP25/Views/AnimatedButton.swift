
import SwiftUI

struct AnimatedButton: View {
    
    @State private var isAnimating = false
    
    var action: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(
                        colors: [.teal, .pink, .red, .teal],
                        center: .center,
                        angle: .degrees(isAnimating ? 360 : 0)
                    )
                )
                .frame(width: 250, height: 50)
                .blur(radius: 20)
                .shadow(color: Color.blue.opacity(0.3), radius: 12, x: 0, y: 0)
                .onAppear {
                    withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }


            Button(action: action) {
                Text("Press to continue")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.black)
                    .frame(width: 250, height: 50)
                    .background(.white, in: .rect(cornerRadius: 25))
                    .overlay {
                        RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 3)
                    }
            }
        }
    }
}


#Preview {
    AnimatedButton {
        print("Funciona")
    }
}

