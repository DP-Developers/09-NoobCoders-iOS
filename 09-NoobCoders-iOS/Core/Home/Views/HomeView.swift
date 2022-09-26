//
//  HomeView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var tabSelected: Tabs = .home
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // background
                Color.theme.background.ignoresSafeArea()
                
                // content
                TabView(selection: $tabSelected) {
                    ContentView()
                        .tabItem {
                            Image(systemName: "house")
                            Text(Tabs.home.rawValue)
                        }
                        .tag(Tabs.home)
                    
                    AllContestsView()
                        .tabItem {
                            Image(systemName: "brain.head.profile")
                            Text(Tabs.contests.rawValue)
                        }
                        .tag(Tabs.contests)
                    
                    ContentView()
                        .tabItem {
                            Image(systemName: "square.grid.2x2.fill")
                            Text(Tabs.resources.rawValue)
                        }
                        .tag(Tabs.resources)
                    
                    NewsView()
                        .tabItem {
                            Image(systemName: "newspaper")
                            Text(Tabs.news.rawValue)
                        }
                        .tag(Tabs.news)
                    
                    JobsView()
                        .tabItem {
                            Image(systemName: "graduationcap")
                            Text(Tabs.jobs.rawValue)
                        }
                        .tag(Tabs.jobs)
                }
                .navigationTitle(returnNavBarTitle(tabSelection: self.tabSelected))
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }
}

extension HomeView {
    enum Tabs: String {
        case home = "Home"
        case contests = "All Contests"
        case resources = "Resources"
        case news = "News"
        case jobs = "Jobs"
    }
    
    func returnNavBarTitle(tabSelection: Tabs) -> String{
        //this function will return the correct NavigationBarTitle when different tab is selected.
        switch tabSelected{
        case .home:
            return Tabs.home.rawValue
        case .contests:
            return Tabs.contests.rawValue
        case .resources:
            return Tabs.resources.rawValue
        case .news:
            return Tabs.news.rawValue
        case .jobs:
           return Tabs.jobs.rawValue
        }
    }
}
