//
//  ResourceCellView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import SwiftUI

struct ResourceCellView: View {
    
    private let resourceDataService = ResourceDataService()
    @State private var bookmarkIsSelected: Bool = false
    @State private var isGreenSelected: Bool = false
    @State private var isRedSeleted: Bool = false
    
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
        HStack(spacing: 15.0) {
            Text("\(resource.upvotedusers.count)")
                .foregroundColor(
                    (resource.upvotedusers.count > 0) ? Color.theme.greenColor :
                        (resource.upvotedusers.count == 0) ? Color.theme.secondaryText : Color.theme.redColor)
            
            Button {
                isGreenSelected = true
                resourceDataService.upvotePressed(resourceTitle: resource.title)
            } label: {
                Image(systemName: "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(Color.theme.greenColor)
            //            .foregroundColor(isGreenSelected ? Color.theme.secondaryText : Color.theme.greenColor)
            .buttonStyle(.plain)
            .disabled(isGreenSelected == true)
            
            Text("\(resource.downvotedusers.count)")
                .foregroundColor(
                    (resource.downvotedusers.count > 0) ? Color.theme.redColor :
                        (resource.downvotedusers.count == 0) ? Color.theme.secondaryText : Color.theme.redColor)
            
            Button {
                isRedSeleted = true
                resourceDataService.downvotePressed(resourceTitle: resource.title)
            } label: {
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(Color.theme.redColor)
            //            .foregroundColor(isRedSeleted ? Color.theme.secondaryText : Color.theme.redColor)
            .buttonStyle(.plain)
            .disabled(isRedSeleted == true)
        }
        .font(.headline)
    }
    
    private var rightSide: some View {
        VStack(alignment: .trailing, spacing: 10.0) {
            //            bookmark
            Spacer()
            upvoteDownvote
        }
    }
}
