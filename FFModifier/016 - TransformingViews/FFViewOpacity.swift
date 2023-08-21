//
//  FFViewOpacity.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何调整视图的不透明度
//  使用opacity()修饰符，任何SwiftUI视图都可以时部分透明或者全透明的，它接受一个介于0（完全不可见）-1（完全不透明）之间的值，与UIKit的alpha属性一致。


import SwiftUI

struct FFViewOpacity: View {
    @State private var opacity = 0.5
    
    var body: some View {
        //创建一个红色文本视图，附加30%透明度
        Text("Hello, World!")
            .padding()
            .background(.red)
            .opacity(0.3)
        //修改不透明度是非常快速的，基本不可见，视图出现即看见结果，通过Slider查看动态效果
        VStack {
            Text("Hello, World!")
                .padding()
                .background(.red)
                .opacity(opacity)
            Slider(value: $opacity, in: 0...1)
        }
        .padding()
    }
}

#Preview {
    FFViewOpacity()
}
