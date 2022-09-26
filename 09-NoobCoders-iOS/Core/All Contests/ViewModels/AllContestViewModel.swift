//
//  AllContestViewModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation
import Combine

class AllContestViewModel: ObservableObject {
    @Published var allContests: [AllContestModel] = []
    @Published var allContestAfter24Hours: [AllContestModel] = []
    @Published var allContestIn24Hours: [AllContestModel] = []
    
    private let contestDataService = ContestDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        contestDataService.$allContestsData
            .sink { [weak self] contests in
                self?.allContests = contests
                self?.allContestIn24Hours = contests.filter({ $0.in24_Hours == .yes})
                self?.allContestAfter24Hours = contests.filter({ $0.in24_Hours == .no})
            }
            .store(in: &cancellabes)
    }
}
