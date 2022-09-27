//
//  ResourceCellView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import SwiftUI

struct ResourceCellView: View {
    
    @State private var bookmarkIsSelected: Bool = false
    let resource: ResourceModel
    
    var body: some View {
        ZStack {
            Color.theme.secondaryBackground.ignoresSafeArea()
            VStack {
                HStack {
                    leftSide
                    Spacer()
                    rightSide
                }
                Link(destination: URL(string: resource.url) ?? URL(string: "https://www.google.com")!) {}
            }
        }
    }
}

struct ResourceCellView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceCellView(resource: dev.resource)
            .previewLayout(.sizeThatFits)
    }
}

extension ResourceCellView {
    private var leftSide: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(resource.title)
                .font(.title3)
                .foregroundColor(Color.theme.accent)
            
            Text(resource.type)
                .font(.headline)
                .foregroundColor(Color.theme.darkOrangeColor)
            
            Text(resource.creator)
                .font(.subheadline)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    
//    private var bookmark: some View {
//        Image(systemName: bookmarkIsSelected ? "bookmark.fill" : "bookmark")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 30, height: 30)
//            .foregroundColor(bookmarkIsSelected ? Color.theme.lightOrangeColor: Color.theme.accent)
//            .padding(.top)
//            .onTapGesture {
//                withAnimation(.easeInOut) {
//                    bookmarkIsSelected.toggle()
//                }
//            }
//    }
    
    private var upvoteDownvote: some View {
        HStack(spacing: 20.0) {
            HStack {
                Text("\(resource.upvotes)")
                    .font(.callout)
                    
                
                Image(systemName: "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(Color.theme.greenColor)
            
            HStack {
                Text("\(resource.downvotes)")
                    .font(.callout)
                    
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(Color.theme.redColor)
        }
    }
    
    private var rightSide: some View {
        VStack(alignment: .trailing, spacing: 10.0) {
//            bookmark
            Spacer()
            upvoteDownvote
        }
    }
}

