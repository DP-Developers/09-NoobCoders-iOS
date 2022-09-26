//
//  NewsImageView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct NewsImageView: View {
    
    @StateObject var vm: NewsImageViewModel
    
    init(article: ArticleModel) {
        _vm = StateObject(wrappedValue: NewsImageViewModel(article: article))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            } else if vm.isLoading {
                ProgressView()
//                Image(systemName: "questionmark")
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(Color.theme.secondaryText)
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct NewsImageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsImageView(article: dev.news)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
