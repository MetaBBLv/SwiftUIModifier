//
//  FFTransitionsCombine.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何组合过度
//  当添加或删除视图是，SwiftUI可以使用combined(with:)方法组合过度来制作新的动画。

import SwiftUI

//为了使组合转换更容易使用和重用，可以在AnyTransition上创建他们作为扩展
extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

struct FFTransitionsCombine: View {
    @State private var showDetails = false
    @State private var showDetails2 = false
        
    var body: some View {
        //例如，同时让视图移动和淡出
        VStack {
            Button("Press to show Details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                Text("Details go here")
                    .transition(AnyTransition.opacity.combined(with: .slide))

            }
        }
        
        VStack {
            Button("Press to show Details") {
                withAnimation {
                    showDetails2.toggle()
                }
            }
            //已经使用扩展声明了函数moveAndscale
            if showDetails2 {
                Text("Details go here")
                    .transition(.moveAndScale)

            }
        }
        
            
    }
}

#Preview {
    FFTransitionsCombine()
}
