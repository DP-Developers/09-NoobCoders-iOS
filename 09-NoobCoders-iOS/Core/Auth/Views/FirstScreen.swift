//
//  FirstScreen.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct FirstScreen: View {
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = true
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            if currentUserSignIn {
                HomeView()
            } else if userOnLoginScreen {
                LoginView()
                    .transition(.move(edge: .trailing))
            } else {
                SignUpView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}


struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
