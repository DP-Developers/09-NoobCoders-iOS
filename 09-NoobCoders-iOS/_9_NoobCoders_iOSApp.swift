//
//  _9_NoobCoders_iOSApp.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

@main
struct _9_NoobCoders_iOSApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.darkOrangeColor)
        UITabBar.appearance().isTranslucent = false
        
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}
