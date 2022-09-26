//
//  NewsView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var vm: NewsDataViewModel = NewsDataViewModel()
    @State private var showSheet: Bool = false
    @State private var selectedArticle: ArticleModel? = nil
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            List {
                ForEach(vm.allNews.articles, content: { article in
                    NewsCellView(news: article)
                        .onTapGesture {
                            segue(article: article)
                        }
                })
                .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            }
            .listStyle(.plain)
            .clipped()
            .sheet(isPresented: $showSheet) {
                NewsDeatilLoadingView(article: $selectedArticle)
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

extension NewsView {
    private func segue(article: ArticleModel) {
        selectedArticle = article
        showSheet.toggle()
    }
}
