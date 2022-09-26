//
//  JobsDataService.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
import Combine

class JobsDataService {
    
    @Published var allJobs: [JobsDataModel] = []
    var jobsDataSubscription: AnyCancellable?
    
    init(tag: String) {
        getJobsData(tag: tag)
    }
    
    func getJobsData(tag: String) {
        guard let url = URL(string: "https://job-spoc-api.herokuapp.com/simplyhired/\(tag)") else { return }
//        guard let url = URL(string: "https://job-spoc-api.herokuapp.com/monster/\(tag)") else { return }
                
        jobsDataSubscription = NetworkingManager.download(url: url)
            .decode(type: [JobsDataModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletionForJobsData, receiveValue: { [weak self]  returnedJobsData in
                self?.allJobs = returnedJobsData
                self?.jobsDataSubscription?.cancel()
            })
    }
}
