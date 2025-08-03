//
//  ContentView.swift
//  Combine2_networkCall
//
//  Created by Mantosh Kumar on 02/08/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = NetworkViewModel()
    
    var body: some View {
        
        NavigationView {
            List(viewModel.posts) { post in
                Text(post.title)
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.postAPICall()
            }
            .overlay {
                Group {
                    if let error = viewModel.errorMessage {
                        Text("Error \(error)")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
