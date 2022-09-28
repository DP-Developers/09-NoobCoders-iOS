//
//  ResourceView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ResourcesView: View {
    
    @ObservedObject private var resourceVm: ResourceViewModel = ResourceViewModel()
    @State private var isSelected: Bool = true
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                searchBar
                List {
                    ForEach(resourceVm.allResources, content: { resource in
                        ResourceCellView(resource: resource)
                    })
                    .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                }
                .listStyle(.plain)
                .clipped()
                .refreshable {
                    self.resourceVm.addResources()
                }
            }
            .onAppear {
                self.resourceVm.addResources()
            }
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResourcesView()
                .navigationTitle("Resources")
        }
    }
}

extension ResourcesView {
    private var searchBar: some View {
        TextField("", text: $searchText)
            .placeholder(when: searchText.isEmpty, placeholder: {
                Text("Kotlin, Swift, Python....")
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
                    resourceVm.filterResources(tag: searchText)
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
}


