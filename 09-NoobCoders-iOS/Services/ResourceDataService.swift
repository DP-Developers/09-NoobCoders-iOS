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
    
    @Published var allResources = [ResourceModel]()
    private var db = Firestore.firestore()
    private let currentUser = Auth.auth().currentUser?.uid ?? ""
    
    init() {
        fetchDataFromFirebase()
    }
    
    func fetchDataFromFirebase() {
        db.collection("resources").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error! No documents Found")
                return
            }
            
            self.allResources = documents.map({ (queryDocumentSnapshot) -> ResourceModel in
                let data = queryDocumentSnapshot.data()
                
                let creator = data["creator"] as? String ?? ""
                let desc = data["desc"] as? String ?? ""
                let tags = data["tags"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                let url = data["url"] as? String ?? ""
                let upvotes = data["upvotes"] as? Int ?? 0
                let downvotes = data["downvotes"] as? Int ?? 0
                let upvotedusers = data["upvotedusers"] as? [String] ?? []
                let downvotedusers = data["downvotedusers"] as? [String] ?? []
                
                return ResourceModel(creator: creator, desc: desc, tags: tags, title: title, type: type, url: url, upvotes: upvotes, downvotes: downvotes, upvotedusers: upvotedusers, downvotedusers: downvotedusers)
                
            })
        }
    }
    
    func upvotePressed(resourceTitle: String) {
        db.collection("resources").getDocuments { [self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error! No documents Found")
                return
            }
            
            for document in documents {
                if resourceTitle == document["title"] as? String ?? "" {
                    let resourceId = document.documentID
                    let upvotedUsersList = document["upvotedusers"] as? [String] ?? []
                    let downvotedusersList = document["downvotedusers"] as? [String] ?? []
                    
                    if (!upvotedUsersList.contains(currentUser)) && (!downvotedusersList.contains(currentUser)) {
                        let dataRef = db.collection("resources").document(resourceId)
                        dataRef.updateData([
                            "upvotedusers": FieldValue.arrayUnion([currentUser] as? [String] ?? []),
                        ])
                    } else if (!upvotedUsersList.contains(currentUser)) && (downvotedusersList.contains(currentUser)) {
                        let dataRef = db.collection("resources").document(resourceId)
                        dataRef.updateData([
                            "upvotedusers": FieldValue.arrayUnion([currentUser] as? [String] ?? []),
                            "downvotedusers": FieldValue.arrayRemove([currentUser] as? [String] ?? [])
                        ])
                    }
                }
            }
        }
        
        self.fetchDataFromFirebase()
    }
    
    func downvotePressed(resourceTitle: String) {
        db.collection("resources").getDocuments { [self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error! No documents Found")
                return
            }
            
            for document in documents {
                if resourceTitle == document["title"] as? String ?? "" {
                    let resourceId = document.documentID
                    let upvotedUsersList = document["upvotedusers"] as? [String] ?? []
                    let downvotedusersList = document["downvotedusers"] as? [String] ?? []
                    
                    if (!upvotedUsersList.contains(currentUser)) && (!downvotedusersList.contains(currentUser)) {
                        let dataRef = db.collection("resources").document(resourceId)
                        dataRef.updateData([
                            "downvotedusers": FieldValue.arrayUnion([currentUser] as? [String] ?? [])
                        ])
                    } else if (upvotedUsersList.contains(currentUser)) && (!downvotedusersList.contains(currentUser)) {
                        let dataRef = db.collection("resources").document(resourceId)
                        dataRef.updateData([
                            "upvotedusers": FieldValue.arrayRemove([currentUser] as? [String] ?? []),
                            "downvotedusers": FieldValue.arrayUnion([currentUser] as? [String] ?? [])
                        ])
                    }
                }
            }
        }
        
        self.fetchDataFromFirebase()
    }
    
}
