//
//  ContributeResourceViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class ContributeResourceViewModel: ObservableObject {
    
//    init(newResource: ResourceModel) {
//        addDataToFirebase(newResource: newResource)
//    }
    
    func addDataToFirebase(newResource: ResourceModel) {
        let db = Firestore.firestore()
        
        db.collection("resources").addDocument(data: [
            "creator": newResource.creator,
            "desc": newResource.desc,
            "downvotes": newResource.downvotes,
            "tags": newResource.tags,
            "title": newResource.title,
            "type": newResource.type,
            "upvotes": newResource.upvotes,
            "url": newResource.url
            
        ]) { error in
            if let e = error {
                print(e.localizedDescription)
                print("There was an error in saving the data in Firestore")
            } else {
                print("Successfully saved data")
            }
        }
    }
}
