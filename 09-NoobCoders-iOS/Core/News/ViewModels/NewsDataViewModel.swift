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
    @Published var topNews: [ArticleModel] = []
    
    private let newsDataService = NewsDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        newsDataService.$allNewsData
            .sink { [weak self] news in
                self?.allNews = news
                self?.topNews.append(contentsOf: (self?.allNews.articles.prefix(3) ?? []))
//                print(self?.topNews ?? "")
            }
            .store(in: &cancellabes)
    }
}
