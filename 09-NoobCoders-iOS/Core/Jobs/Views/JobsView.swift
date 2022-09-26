//
//  JobsView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct JobsView: View {
    
    @StateObject private var vm: JobsDataViewModel = JobsDataViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                searchBar
                List {
                    ForEach(vm.allJobs, content: { job in
                        JobsCellView(job: job)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                bookmarkButton
                            }
                    })
                    .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                }
                .listStyle(.plain)
            }
        }
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobsView()
        }
    }
}

extension JobsView {
    private var searchBar: some View {
        TextField("", text: $searchText)
            .placeholder(when: searchText.isEmpty, placeholder: {
                Text("Search for jobs, comapnies...")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .overlay(alignment: .trailing) {
                Button {
                    vm.jobsDataService.getJobsData(tag: searchText)
                    UIApplication.shared.endEditing()
                    searchText = ""
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 10)
                        .opacity(
                            searchText.isEmpty ? 0 : 1
                        )
                }
            }
            .cornerRadius(10)
            .padding()
    }
    
    private var bookmarkButton: some View {
        Button {
            print("Bookmark")
        } label: {
            Label("Bookmark", systemImage: "bookmark.fill")
        }
        .tint(Color.theme.darkOrangeColor)
    }
}
