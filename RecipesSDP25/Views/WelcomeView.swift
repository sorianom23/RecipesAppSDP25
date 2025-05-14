

import SwiftUI

struct WelcomeView: View {
    
    @State private var showContentView = false

    var body: some View {
        if showContentView {
            ContentView()
        } else {
            VStack(spacing: 40) {
                Spacer()

                VStack(spacing: 10) {
                    Text("Hi, Chef!")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Looking for new recipes?\nYou're in the right place.")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                AnimatedButton {
                    showContentView = true
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
