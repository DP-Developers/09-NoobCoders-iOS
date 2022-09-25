//
//  LaunchView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//

import SwiftUI

struct LaunchView: View {
    
    // maps the strings into an array of string with each character as an element.
    
    @State private var loadingText: [String] = "An App made by coders for coders...".map({ String($0) })
    @State private var showLoadingText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // background
            Color.launch.background.ignoresSafeArea()
            
            // content
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.launch.accent)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0.0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launch.accent)
                                .offset(y: counter == index ? -15 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if lastIndex == counter {
                    counter = 0
                    loops += 1
                    
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
