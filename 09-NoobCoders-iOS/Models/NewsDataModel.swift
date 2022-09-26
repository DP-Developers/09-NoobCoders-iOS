//
//  NewsDataModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation

struct NewsDataModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

struct ArticleModel:Identifiable,  Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    var id: String? {
        source.id ?? UUID().uuidString
    }
}

struct Source: Codable {
    let id: String?
    let name: String
}
