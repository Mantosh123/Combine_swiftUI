//
//  ContentView.swift
//  Combine3_Timer
//
//  Created by Mantosh Kumar on 07/09/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var currentTime = Date()
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            Text("Current Time")
                .font(.headline)

            Text("\(currentTime, formatter: DateFormatter.timeFormatter)")
                .font(.largeTitle)
                .monospacedDigit()
        }
        .onReceive(timer) { input in
            currentTime = input
        }
        .padding()
    }
}

extension DateFormatter {
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
}


#Preview {
    ContentView()
}
