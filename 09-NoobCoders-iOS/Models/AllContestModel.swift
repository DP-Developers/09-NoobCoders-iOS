//
//  AllContestModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation

struct AllContestModel: Identifiable, Codable {
    let name: String
    let url: String
    var startTime, endTime, duration: String
    let site: Site
    var in24_Hours: In24_Hours
    let status: Status
    var id = UUID().uuidString

    enum CodingKeys: String, CodingKey {
        case name, url
        case startTime = "start_time"
        case endTime = "end_time"
        case duration, site
        case in24_Hours = "in_24_hours"
        case status
    }
}

enum In24_Hours: String, Codable {
    case no = "No"
    case yes = "Yes"
}

enum Site: String, Codable {
    case atCoder = "AtCoder"
    case codeChef = "CodeChef"
    case codeForces = "CodeForces"
    case hackerEarth = "HackerEarth"
    case hackerRank = "HackerRank"
    case kickStart = "Kick Start"
    case leetCode = "LeetCode"
    case topCoder = "TopCoder"
}

enum Status: String, Codable {
    case before = "BEFORE"
    case coding = "CODING"
}
