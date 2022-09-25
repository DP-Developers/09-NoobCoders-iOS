//
//  ContentView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .overlay(Color.theme.background)
                .cornerRadius(10)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .overlay(Color.theme.secondaryBackground)
                .cornerRadius(10)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .overlay(Color.theme.darkOrangeColor)
                .cornerRadius(10)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .overlay(Color.theme.lightOrangeColor)
                .cornerRadius(10)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .overlay(Color.theme.secondaryText)
                .cornerRadius(10)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
