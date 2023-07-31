//
//  FFLaunches.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/27.
//
//  如何控制App的启动时加载那个视图
//  当你创建一个SwiftUI项目时，Xcode将自动创建一个与你项目同名的Swift文件，该文件用于引导你的App加载第一个画面

import SwiftUI

struct FFFirstView: View {
    var body: some View {
        Text("First")
    }
}

struct FFSecondView: View {
    var body: some View {
        Text("Second")
    }
}

struct FFThirdView: View {
    var body: some View {
        Text("Third")
    }
}

struct FFFourView: View {
    var body: some View {
        Text("Four")
    }
}

struct FFLaunches: View {

    var body: some View {
        TabView {
            FFFirstView()
                .tabItem { Label("First", systemImage: "moonphase.first.quarter") }
            FFSecondView()
                .tabItem { Label("Second", systemImage: "moonphase.first.quarter") }
            FFThirdView()
                .tabItem { Label("Third", systemImage: "moonphase.first.quarter") }
            FFFourView()
                .tabItem { Label("four", systemImage: "moonphase.first.quarter") }
        }
    }
}

#Preview {
    FFLaunches()
}
