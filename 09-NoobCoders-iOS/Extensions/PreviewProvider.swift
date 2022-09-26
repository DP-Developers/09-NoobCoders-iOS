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
    
      let news = ArticleModel(source: _9_NoobCoders_iOS.Source.init(id: UUID().uuidString, name: "Google News"),
                            author: "Prathamesh Araikar",
                            title: "iOS 16 is here: Here's how to get Apple's free operating system update on your iPhone - The Indian Express",
                            description: "And redesigned camera island.",
                            url: "https://www.gsmarena.com/first_oneplus_11_pro_renders_surface_alert_slider_in_tow-news-55749.php",
                            urlToImage: "https://images.macrumors.com/t/Rh5xQmtx7wcjjdxRsryCwyC2kng=/2126x/article-new/2022/09/apple-watch-ultra-2.jpg",
                            publishedAt: Date(),
                            content: "Apple may be paying the price for being too confident regarding the regular iPhone 14 models. According to analyst Ming-Chi Kuo, the iPhone 14 and 14 Plus versions are selling worse than the iPhone 1… [+3140 chars]")
}
