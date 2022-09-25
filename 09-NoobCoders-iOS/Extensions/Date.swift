//
//  Date.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation

extension Date {
    
    // "2021-03-13T20:49:26.606Z"
    init(utcDateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: utcDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    // 2022-09-21 14:30:00 UTC
    init(codechefString: String) {
        let formatter = DateFormatter()
        let parsedString = codechefString.replacingOccurrences(of: " ", with: "T")
        let finalString = parsedString.replacingOccurrences(of: "TUTC", with: ".000Z")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: finalString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        return formatter
    }
    
    func asDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
}
