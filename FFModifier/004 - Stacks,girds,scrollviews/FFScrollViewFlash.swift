//
//  FFScrollViewFlash.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使ScrollView或List的滚动条指示器闪烁
//  SwiftUI给我们提供了scrollindicatorsFlash()四是福来控制ScrollView或List的滚动指示器何时应该闪烁，这是通知用户其数据某些部分已更改的好方法。此修饰符有两种形式：当滚动视图出现时指示器是否应该闪烁，当值更改时指示器是否应该闪烁

import SwiftUI

struct FFScrollViewFlash: View {
    @State private var exampleState = false
    
    var body: some View {
        List {
            Section {
                //ScrollView首次显示时闪烁
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 300)
                .scrollIndicatorsFlash(onAppear: true)
            }
            
            Section {
                //或者，创建一个自定义值来跟踪指示器是否应该闪烁，这可以时任何Equatable值，只要该值变化，指示器就闪烁
                Button("Flash!") {
                    exampleState.toggle()
                }
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundStyle(.white)
                    }
                }
                .frame(height: 300)
                .scrollIndicatorsFlash(trigger: exampleState)
                //相同的代码与 List 一起使用，就像与 ScrollView 一起使用一样。
            }
        }
    }
}

#Preview {
    FFScrollViewFlash()
}
