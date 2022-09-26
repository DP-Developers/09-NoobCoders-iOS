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
    @Published var topJobs: [JobsDataModel] = []
    
    let jobsDataService = JobsDataService(tag: "developer")
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        jobsDataService.$allJobs
            .sink { [weak self] job in
                self?.allJobs = job
                self?.topJobs.append(contentsOf: (self?.allJobs.prefix(3) ?? []))
                print(self?.topJobs ?? "")
            }
            .store(in: &cancellabes)
    }
}
