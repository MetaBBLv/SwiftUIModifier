//
//  FFTransitionAsymmetric.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何创建不对称过渡动画
//  SwiftUI可以在添加一个视图是指定transition，在删除时指定另一个transition。所有这些都是使用asymmetric()完成的。

import SwiftUI

struct FFTransitionAsymmetric: View {
    @State private var showDetails = false
    
    var body: some View {
        //创建一个使用不对称过渡的文本视图：添加时从左面出现，删除时向下移动
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                Text("Details go here")
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    FFTransitionAsymmetric()
}
