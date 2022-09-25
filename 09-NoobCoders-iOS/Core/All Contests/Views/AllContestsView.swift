//
//  AllContestsView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct AllContestsView: View {
    @StateObject private var vm: AllContestViewModel = AllContestViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                List {
                    ForEach(vm.allContests, content: { contest in
                        ContestView(contest: contest)
                    })
                    .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                }
                .listStyle(.plain)
                .clipped()
            }
        }
    }
}

struct AllContestsView_Previews: PreviewProvider {
    static var previews: some View {
        AllContestsView()
    }
}
