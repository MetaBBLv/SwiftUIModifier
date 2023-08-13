//
//  FFBarsHidden.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何隐藏Tabbar、navigationBar、toolbars
//  SwiftUI的toolbar()修饰符允许我们在需要的时候隐藏或显示任何系统栏，当你有一个TabView想要在导航推送之后隐藏的时候，这个修饰符特别有用。
//  将修饰符附加到可以触发隐藏或显示toolbar的任何视图上

import SwiftUI

struct FFBarsDetailView: View {
    @State private var showNavigationBar = true
    
    var body: some View {
        Text("Detail View")
            .toolbar(showNavigationBar ? .visible : .hidden)
            .onTapGesture {
                withAnimation {
                    showNavigationBar.toggle()
                }
            }
    }
}

struct FFBarsHidden: View {
    var body: some View {
        TabView {
            NavigationStack {
                NavigationLink("Tap Me") {
                    Text("Detail View")
                        .toolbar(.hidden, for: .tabBar)
                }
                .navigationTitle("Primary View")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            //如果你没有指定要隐藏的是谁（for：tabbar），那么隐藏效果将流向最近的容器，可能是导航栏被隐藏。
            //当随时改变传递给toolbar的值，就可以动态切换导航栏了
            NavigationStack {
                NavigationLink("DetailView", destination: FFBarsDetailView.init())
                    .navigationTitle("Primary View")
            }
            .tabItem {
                Label("Detail", systemImage: "1.circle")
            }
            
        }
    }
}

#Preview {
    FFBarsHidden()
}
