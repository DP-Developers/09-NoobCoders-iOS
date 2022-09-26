//
//  NewsImageService.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine
import SwiftUI

class NewsImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let article: ArticleModel

    
    init(article: ArticleModel) {
        self.article = article
        downloadNewsImage()
    }
        
    private func downloadNewsImage() {
        if let urlString = article.urlToImage {
            guard let url = URL(string: urlString) else { return }
            imageSubscription = NetworkingManager.download(url: url)
                .tryMap({ (data) -> UIImage? in
                    return UIImage(data: data)
                })
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: NetworkingManager.handleCompletionForNewsData, receiveValue: { [weak self]  returnedImage in
                    guard let self = self, let downloadedImage = returnedImage else { return }
                    self.image = downloadedImage
                    self.imageSubscription?.cancel()
                })
        }
    }
}
