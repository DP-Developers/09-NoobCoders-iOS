//
//  PreviewProvider.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let contest = AllContestModel(
        name: "ICPC 2022 Online Challenge powered by HUAWEI - Problem 2",
        url: "https://codeforces.com/contestRegistration/1724",
        startTime: "Sep 15, 05:30",
        endTime: "Sep 30, 05:30",
        duration: "1296000",
        site: _9_NoobCoders_iOS.Site.codeForces,
        in24_Hours: _9_NoobCoders_iOS.In24_Hours.no,
        status: _9_NoobCoders_iOS.Status.before)
}
