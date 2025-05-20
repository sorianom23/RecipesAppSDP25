

import SwiftUI

struct TimerView: View {

    @State private var minutes: Int = 5
    @State private var secondsRemaining: Int? = nil
    @State private var isRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 30) {
            Text("Cooking Timer")
                .font(.title)
                .bold()

            Text(timeFormatted(secondsRemaining ?? (minutes * 60)))
                .font(.system(size: 60, weight: .bold, design: .monospaced))
                .padding()
                .transaction { $0.animation = isRunning ? .default : nil } 

            Stepper("Minutes: \(minutes)", value: $minutes, in: 1...120)
                .padding(.horizontal)
                .disabled(isRunning)

            HStack(spacing: 20) {
                Button(action: toggleTimer) {
                    Label(isRunning ? "Pause" : "Start", systemImage: isRunning ? "pause.fill" : "play.fill")
                        .padding()
                        .frame(maxWidth: 105)
                        .background(isRunning ? Color.orange : Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

                Button(action: resetTimer) {
                    Label("Reset", systemImage: "arrow.counterclockwise")
                        .padding()
                        .frame(maxWidth: 105)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .disabled(!isRunning && secondsRemaining == nil)
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            stopTimer()
        }
    }


    func toggleTimer() {
        isRunning ? stopTimer() : startTimer()
    }

    func startTimer() {
        secondsRemaining = (secondsRemaining ?? (minutes * 60))
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let remaining = secondsRemaining, remaining > 0 {
                secondsRemaining = remaining - 1
            } else {
                stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    func resetTimer() {
        stopTimer()
        secondsRemaining = nil
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}



#Preview("TimerView") {
    NavigationStack {
        TimerView()
    }
}
