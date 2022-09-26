//
//  JobsDataViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine

class JobsDataViewModel: ObservableObject {
    @Published var allJobs: [JobsDataModel] = []
    let jobsDataService = JobsDataService(tag: "developer")
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        jobsDataService.$allJobs
            .sink { [weak self] job in
                self?.allJobs = job
            }
            .store(in: &cancellabes)
    }
}
