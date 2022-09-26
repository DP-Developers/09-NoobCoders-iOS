//
//  MainHome.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import SwiftUI

struct MainHome: View {
    @StateObject private var contestVm: AllContestViewModel = AllContestViewModel()
    @StateObject private var newsVm: NewsDataViewModel = NewsDataViewModel()
    @StateObject private var jobsVm: JobsDataViewModel = JobsDataViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            ScrollView {
                Section {
                    ContestView(contest: contestVm.firstContest)
                } header: {
                    HStack {
                        Text("Upcoming Contests")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                }

                Section {
                    ForEach(newsVm.topNews) { article in
                        NewsCellView(news: article)
                            .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                            .padding(.bottom)
                    }
                } header: {
                    HStack {
                        Text("Top Stories")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                }
                
                Section {
                    ForEach(jobsVm.topJobs) { job in
                        JobsCellView(job: job)
                            .padding(.bottom)
                    }
                } header: {
                    HStack {
                        Text("Trending Jobs")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                }

            }
        }
    }
}

struct MainHome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainHome()
        }
    }
}
