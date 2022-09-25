//
//  Color.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryBackground = Color("SecondaryBgColor")
    let darkOrangeColor = Color("DarkOrangeColor")
    let lightOrangeColor = Color("LightOrangeColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchTheme {

    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")

}

