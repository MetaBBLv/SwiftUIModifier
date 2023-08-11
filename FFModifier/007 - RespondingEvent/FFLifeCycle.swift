//
//  FFLifeCycle.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/27.
//
//  如何响应视图的生命周期事件：onAppear()和onDisappear()
//  SwiftUI有与UIKit的viewDidAppear()和viewDidDisappear()相似的函数onAppear()和onDisAppear()

import SwiftUI

struct FFLifeCycle: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                NavigationLink {
                    FFDetailView()
                } label: {
                    Text("Hi, BBLv")
                }
            }
            .onAppear {
                print("ContentView appeared!")
            }
            .onDisappear {
                print("ContentView disappeared!")
            }
        }
    }
}

struct FFDetailView: View {
    var body: some View {
        VStack {
            Text("Second View")
        }
        .onAppear {
            print("FFDetailView appeared!")
        }
        .onDisappear {
            print("FFDetailView disappeared!")
        }
    }
}

#Preview {
    FFLifeCycle()
}
