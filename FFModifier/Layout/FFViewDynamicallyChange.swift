//
//  FFViewDynamicallyChange.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何在VStack和HStack之间动态切换
//  SwiftUI的AnyLayout结构题允许我们在HStack和Vstask之间自由切换，基于我们想要考虑的任何环境上下文，只要记住使用每一个伏虎布局的变体
import SwiftUI

struct FFViewDynamicallyChange: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        
        List {
            Section {
                //提示：与使用AnyView不同，AnyLayout不会产生任何性能影响，并且不会丢弃其子视图的任何状态。
                let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
                
                layout {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                }
                .font(.largeTitle)
            }
            
            Section {
                let layout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
                layout {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                }
                .font(.largeTitle)
            }
            //除了VStackLayout和HStackLayout之外，还可以使用ZStackLayout和GridLayout
        }
    }
}

#Preview {
    FFViewDynamicallyChange()
}
