//
//  ContestView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct ContestView: View {
    
    let contest: AllContestModel
    
    var body: some View {
        ZStack {
            Color.theme.secondaryBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                top
                bottom
                Link("", destination: (URL(string: contest.url) ?? URL(string: "https://www.google.com")!))
                
            }
            .padding(.horizontal)
            .foregroundColor(Color.theme.accent)
        }
    }
}

struct ContestView_Previews: PreviewProvider {
    static var previews: some View {
        ContestView(contest: dev.contest)
            .previewLayout(.sizeThatFits)
    }
}

extension ContestView {
    private var top: some View {
        HStack {
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(Color.theme.lightOrangeColor)
                .padding(.vertical, 2)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
    
    private var bottom: some View {
        VStack(alignment: .leading) {
            Text(contest.name)
                .font(.headline)

            Text(contest.startTime + " - " + contest.endTime)
                .font(.callout)
                .foregroundColor(Color.theme.secondaryText)
                .padding(.vertical, 5)
        }
    }
}
