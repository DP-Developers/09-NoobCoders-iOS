//
//  ResourceDataService.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class ResourceDataService {
    @Published var resourceService: [ResourceModel] = []
    
    init() {
        loadResourcesFromFirebase()
    }
    
    func loadResourcesFromFirebase() {
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
                                self.resourceService.append(newResource)
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
