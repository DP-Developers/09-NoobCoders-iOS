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
    
//    @StateObject private var resourceVm: ResourceViewModel = ResourceViewModel()
    @State private var resources: [ResourceModel] = []
//    private let resourceDataService = ResourceDataService()
    @State private var isSelected: Bool = true
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                List {
                    ForEach(resources, content: { resource in
                        ResourceCellView(resource: resource)
                    })
                    .listRowBackground(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
                }
                .listStyle(.plain)
                .clipped()
//                .refreshable {
//                    print("refresh")
//                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    resources = []
                    loadResources()
                }
                
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
    private func loadResources() {
        let db = Firestore.firestore()
        
        db.collection("resources").getDocuments { querySnapshot, error in
            if let e = error {
                print("There was an error in retrieving data \(e.localizedDescription)")
            } else {
                if let querySnapshotDocuments = querySnapshot?.documents {
                    for document in querySnapshotDocuments {
                        if
                            let creator = document["creator"] as? String,
                            let description = document["desc"] as? String,
                            let tags = document["tags"] as? String,
                            let title = document["title"] as? String,
                            let type = document["type"] as? String,
                            let url = document["url"] as? String,
                            let upvotes = document["upvotes"] as? Int,
                            let downvotes = document["downvotes"] as? Int {
                            
                            DispatchQueue.main.async {
                                let newResource = ResourceModel(creator: creator, desc: description, tags: tags, title: title, type: type, url: url, upvotes: upvotes, downvotes: downvotes)
                                self.resources.append(newResource)
//                                print(resources)
                            }
                            
                        } else {
                            print("Error fetching data!!")
                        }
                    }
                }
            }
        }
    }
}
