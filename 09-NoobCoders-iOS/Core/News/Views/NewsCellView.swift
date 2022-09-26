//
//  NewsCellView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct NewsCellView: View {
    
    let news: ArticleModel
    
    var body: some View {
        ZStack {
            Color.theme.secondaryBackground.ignoresSafeArea()
            
            HStack(spacing: 15.0) {
                leftSide
                rightSide
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news: dev.news)
    }
}

extension NewsCellView {
    private var leftSide: some View {
        HStack(spacing: 0.0) {
            NewsImageView(article: news)
                .frame(width: 100, height: 100)
        }
    }
    
    private var rightSide: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(news.title)
                .foregroundColor(.white)
                .font(.headline)
//                .lineLimit(3)
            
            Text(news.source.name)
                .foregroundColor(Color.theme.secondaryText)
                .font(.subheadline)
        }
    }
}
