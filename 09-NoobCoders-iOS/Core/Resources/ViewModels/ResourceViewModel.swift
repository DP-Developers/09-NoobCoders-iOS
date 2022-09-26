//
//  ResourceViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import Foundation
import Combine

class ResourceViewModel: ObservableObject {
    @Published var allResources: [ResourceModel] = []
    private let resourceDataService = ResourceDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addResources()
    }
    
    func addResources() {
        resourceDataService.$resourceService
            .sink { [weak self] resource in
                DispatchQueue.main.async {
                    self?.allResources = resource
                }
            }
            .store(in: &cancellabes)
    }
}
