//
//  SettingsView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 28/09/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    private let instagramURL = URL(string: "https://www.instagram.com/the_wazir__/")!
    private let linkedInURL = URL(string: "https://www.linkedin.com/in/prathamesh-araikar-548a44206/")!
    private let githubURL = URL(string: "https://github.com/Prathamesh-Araikar")!
    private let kontestsURL = URL(string: "https://kontests.net/api")!
    private let newsAPIURL = URL(string: "https://newsapi.org/s/india-technology-news-api")!
    private let defaultURL = URL(string: "https://www.google.com")!
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = true
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // background
                Color.theme.background.ignoresSafeArea()
                
                // content
                List {
                    cryptoTrackerSection
                        .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                    
                    kontestsAPISection
                        .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                    
                    newsAPISection
                        .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                    
                    developerSection
                        .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                    
                    applicationSection
                        .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}

extension SettingsView {
    private var cryptoTrackerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("DoCodeLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app uses SwiftUI, MVVM Architecture, Combine and Firebase")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
        } header: {
            Text("DO CODE")
        }
    }
    
    private var kontestsAPISection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("KontestsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The Contests data used in this app is downloaded from Kontests API which is free. Contests may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit Kontests 🏆", destination: kontestsURL)
                .foregroundColor(Color.theme.lightOrangeColor)
                .font(.headline)
        } header: {
            Text("KONTESTS API")
        }
    }
    
    private var newsAPISection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("NewsAPIIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The News data used in this app is downloaded from News API which is free. News may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit News API 📰", destination: newsAPIURL)
                .foregroundColor(Color.theme.lightOrangeColor)
                .font(.headline)
        } header: {
            Text("NEWS API")
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("MyPhoto")
                    .resizable()
                    .scaledToFit()
                    .frame( width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The iOS version of this app was made by Prathamesh Araikar. This project benefits from Multithreading, Publishers/Subscribers and Data Persistence.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Group {
                Link("Follow me on Instagram 😉", destination: instagramURL)
                Link("Connect with me on LinkedIn 😇", destination: linkedInURL)
                Link("Checkout my Github 😊", destination: githubURL)
            }
            .foregroundColor(Color.theme.lightOrangeColor)
            .font(.headline)
        } header: {
            Text("ABOUT DEVELOPER")
        }
    }
    
    private var applicationSection: some View {
        Section {
            Group {
                Link("Terms of Service", destination: defaultURL)
                Link("Privacy Policy", destination: defaultURL)
                Link("Company Website", destination: defaultURL)
                Link("Learn More", destination: defaultURL)
                Button {
                    currentUserSignIn.toggle()
                    userOnLoginScreen.toggle()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(Color.theme.accent)
                        .font(.headline)
                }
            }
            .foregroundColor(Color.theme.lightOrangeColor)
            .font(.headline)
        } header: {
            Text("APPLICATION")
        }
    }
}

