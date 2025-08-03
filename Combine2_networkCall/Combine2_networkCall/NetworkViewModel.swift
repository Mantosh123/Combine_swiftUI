//
//  NetworkManager.swift
//  Combine2_networkCall
//
//  Created by Mantosh Kumar on 03/08/25.
//

import SwiftUI
import Foundation
import Combine

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
}

class NetworkViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func postAPICall() {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
                
            } receiveValue: { posts in
                self.posts = posts
            }
            .store(in: &cancellables)
    }
}
