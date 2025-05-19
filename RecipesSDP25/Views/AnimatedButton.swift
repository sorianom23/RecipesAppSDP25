
import SwiftUI

struct AnimatedButton: View {
    
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1
    @State private var isPressed: Bool = false
    
    var action: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(
                        colors: [.green, .pink, .blue, .teal],
                        center: .center,
                        angle: .degrees(isAnimating ? 360 : 0)
                    )
                )
                .blur(radius: isAnimating ? 5 : 14)
                .frame(width: 250, height: 50)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
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

