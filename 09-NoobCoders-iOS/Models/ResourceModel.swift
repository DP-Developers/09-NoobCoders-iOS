//
//  ResourceModel.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import Foundation
import SwiftUI

struct ResourceModel: Identifiable {
    let creator, desc, tags, title, type: String
    let url: String
    let upvotes, downvotes: Int
    var id = UUID().uuidString
}
