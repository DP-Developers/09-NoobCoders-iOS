//
//  ContestDataService.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation
import Combine

class ContestDataService {
    
    @Published var allContestsData: [AllContestModel] = []
    @Published var updatedContestsData: [AllContestModel] = []
    @Published var codechefContestsData: [AllContestModel] = []
    var allContestSubscription: AnyCancellable?
    
    init() {
        getContestsData()
    }
    
    func getContestsData() {
        guard let url = URL(string: "https://kontests.net/api/v1/all") else { return }
        
        allContestSubscription = NetworkingManager.download(url: url)
            .decode(type: [AllContestModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .map(convertDates)
            .sink(receiveCompletion: NetworkingManager.handleCompletionForContestsData, receiveValue: { [weak self]  returnedContestsData in
                self?.allContestsData = returnedContestsData
                self?.allContestSubscription?.cancel()
            })
    }
    
    func convertDates(contestList: [AllContestModel]) -> [AllContestModel] {
        for contest in contestList {
            var contest = contest
            if contest.site == "CodeChef" {
                contest.startTime = Date(codechefString: contest.startTime).asDateString()
                contest.endTime = Date(codechefString: contest.endTime).asDateString()
                updatedContestsData.append(contest)
            } else {
                contest.startTime = Date(utcDateString: contest.startTime).asDateString()
                contest.endTime = Date(utcDateString: contest.endTime).asDateString()
                updatedContestsData.append(contest)
            }
        }
        return updatedContestsData
    }
}
