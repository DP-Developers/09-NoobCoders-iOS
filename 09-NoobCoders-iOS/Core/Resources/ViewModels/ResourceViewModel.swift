//
//  ResourceViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import Foundation
import Combine

class ResourceViewModel: ObservableObject {
    @Published var allResources = [ResourceModel]()
    private let resourceDataService = ResourceDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addResources()
    }
    
    func addResources() {
        resourceDataService.$allResources
            .map(sortResources)
            .sink { [weak self] resource in
                self?.allResources = resource
            }
            .store(in: &cancellabes)
    }
        
    private func sortResources(resourceArray: [ResourceModel]) -> [ResourceModel] {
        return resourceArray.sorted(by: { $1.upvotedusers.count < $0.upvotedusers.count })
    }
    
    func filterResources(tag: String) {
        let tags = tag.replacingOccurrences(of: ",", with: " ").lowercased()
        self.allResources = allResources.filter { resource in
            return resource.tags.lowercased().contains(tags) || resource.title.lowercased().contains(tags) || resource.desc.contains(tags) || resource.creator.lowercased().contains(tags)
        }
    }
}





// YT
//    @Published var allResources = [ResourceModel]()
//
//    private var db = Firestore.firestore()
//
//    func fetchDataFromFirebase() {
//        db.collection("resources").addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else {
//                print("Error! No documents Found")
//                return
//            }
//
//            self.allResources = documents.map({ (queryDocumentSnapshot) -> ResourceModel in
//                let data = queryDocumentSnapshot.data()
//
//                let creator = data["creator"] as? String ?? ""
//                let desc = data["desc"] as? String ?? ""
//                let tags = data["tags"] as? String ?? ""
//                let title = data["title"] as? String ?? ""
//                let type = data["type"] as? String ?? ""
//                let url = data["url"] as? String ?? ""
//                let upvotes = data["upvotes"] as? Int ?? 0
//                let downvotes = data["downvotes"] as? Int ?? 0
//
//                return ResourceModel(creator: creator, desc: desc, tags: tags, title: title, type: type, url: url, upvotes: upvotes, downvotes: downvotes)
//
//            })
//        }
//    }
