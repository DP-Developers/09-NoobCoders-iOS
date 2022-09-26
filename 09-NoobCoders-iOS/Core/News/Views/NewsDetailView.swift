//
//  NewsDetailView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct NewsDeatilLoadingView: View {
    
    @Binding var article: ArticleModel?
    
    init(article: Binding<ArticleModel?>) {
        self._article = article
    }
    
    var body: some View {
        ZStack {
            if let article = article {
                NewsDetailView(article: article)
            }
        }
    }
}

struct NewsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let article: ArticleModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20.0) {
                        newsImage
                        newsTitle
                        publisherName
                        
                        Divider()
                        
                        if let content = article.content {
                            Text(content)
                                .font(.subheadline)
                                .foregroundColor(Color.theme.secondaryText)
                                .padding(.horizontal)
                        } else if let description = article.description {
                            Text(description)
                                .font(.subheadline)
                                .foregroundColor(Color.theme.secondaryText)
                                .padding(.horizontal)
                        } else {
                            Text("No content Available")
                                .font(.title)
                                .foregroundColor(Color.theme.secondaryText)
                                .padding(.horizontal)
                        }
                        
                        authorSection
                        dateSection
                        readFullArticleButton
                    }
                }
            }
            .navigationTitle("Summary")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(article: dev.news)
    }
}

extension NewsDetailView {
    private var newsImage: some View {
        NewsImageView(article: article)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height/5)
    }
    
    private var newsTitle: some View {
        Text(article.title)
            .font(.title3)
            .foregroundColor(Color.theme.accent)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    private var publisherName: some View {
        Text(article.source.name)
            .font(.headline)
            .foregroundColor(Color.theme.darkOrangeColor)
            .padding(.horizontal)
    }
    
    private var authorSection: some View {
        HStack(spacing: 0.0) {
            Spacer()
            Text("~by ")
                .font(.subheadline)
            
            Text(article.author ?? "N/A")
                .font(.headline)
        }
        .foregroundColor(Color.theme.accent)
        .padding(.horizontal)
    }
    
    private var dateSection: some View {
        HStack {
            Spacer()
            Text("Published At:")
                .font(.callout)
            
            Text(article.publishedAt.asDateString())
                .font(.headline)
        }
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
    private var readFullArticleButton: some View {
        Link(destination: URL(string: article.url) ?? URL(string: "https://www.google.com")!) {
            Text("Read Full Article")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    Color.theme.lightOrangeColor
                )
                .cornerRadius(10)
                .padding(.horizontal)
                .shadow(color: Color.theme.lightOrangeColor.opacity(0.2), radius: 10, x: 0, y: 10)
        }
        .padding()
    }
}
