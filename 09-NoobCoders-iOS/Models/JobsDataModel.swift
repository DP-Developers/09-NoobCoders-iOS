//
//  JobsDataModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import Foundation
struct JobsDataModel: Codable, Identifiable {
    private enum CodingKeys : String, CodingKey {
        case companylocation, companyname, jobtitle, urllink
    }
    
    let companylocation, companyname, jobtitle: String
    let urllink: String
    var id = UUID().uuidString
}
