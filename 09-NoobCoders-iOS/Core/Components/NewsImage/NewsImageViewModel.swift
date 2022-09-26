//
//  NewsImageViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine
import SwiftUI

class NewsImageViewModel: ObservableObject {

    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false

    private var cancellabes = Set<AnyCancellable>()
    private let article: ArticleModel
    private let dataService: NewsImageService

    init(article: ArticleModel) {
        self.article = article
        self.dataService = NewsImageService(article: article)
        self.addSubscriber()
        self.isLoading = true
    }

    private func addSubscriber() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellabes)
    }
}
