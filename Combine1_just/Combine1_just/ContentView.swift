//
//  ContentView.swift
//  Combine1_just
//
//  Created by Mantosh Kumar on 29/07/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var message = "Loading..."
    @State private var cancelable: AnyCancellable?
    
    var body: some View {
        VStack {
            Text(message)
                .font(.title)
            
            Button("Click Me to get data") {
                cancelable = Just("I am Mantosh, and you!!")
                    .sink(receiveValue: { value in
                        message = value
                    })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
