//
//  NewsDataViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine

class NewsDataViewModel: ObservableObject {
    @Published var allNews: NewsDataModel = NewsDataModel(status: "", totalResults: 0, articles: [])
    private let newsDataService = NewsDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        newsDataService.$allNewsData
            .sink { [weak self] news in
                self?.allNews = news
            }
            .store(in: &cancellabes)
    }
}
