//
//  NewsDataService.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var allNewsData: NewsDataModel = NewsDataModel(status: "", totalResults: 0, articles: [])
    var newsDataSubscription: AnyCancellable?
    
    init() {
        getNewsData()
    }
    
    func getNewsData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=88d84abc92da4626a4b733c1e6762fa5") else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        newsDataSubscription = NetworkingManager.download(url: url)
            .decode(type: NewsDataModel.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletionForNewsData, receiveValue: { [weak self]  returnedNewsData in
                self?.allNewsData = returnedNewsData
                self?.newsDataSubscription?.cancel()
            })
    }
}

