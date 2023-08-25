//
//  FFTransitionView.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何通过transition添加和删除视图
//  可以在设计中包含和排除一个视图，只需要使用一个常规的Swift条件

import SwiftUI

struct FFTransitionView: View {
    @State private var showDetails = false
    @State private var showDetails1 = false
    
    var body: some View {
        //例如，点击按钮添加或删除文本
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            if showDetails {
                Text("Details go here")
            }
        }
        //默认情况下，SwiftUI使用淡出动画来插入或闪促视图，但是想要自定义效果，可以使用transition()修饰符来自定义
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails1.toggle()
                }
            }
            
            if showDetails1 {
                Text("Details go here")
                    .transition(.move(edge: .bottom))
                
                Text("Details go here")
                    .transition(.slide)
                
                Text("Details go here")
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    FFTransitionView()
}
