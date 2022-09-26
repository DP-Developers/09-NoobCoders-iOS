//
//  _9_NoobCoders_iOSApp.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        return true
    }
}

@main
struct _9_NoobCoders_iOSApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.darkOrangeColor)
        UITabBar.appearance().isTranslucent = false
        
        UITableView.appearance().backgroundColor = UIColor.clear
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.theme.lightOrangeColor)
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ZStack {
                    FirstScreen()
                }
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}

