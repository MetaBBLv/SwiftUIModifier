//
//  FFViewPadding.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
// 如何使用填充控制各个视图周围的间距
// 在SwiftUI中，可以使用修饰符在视图的周围单独填充padding(),从而使视图距离相邻的视图更远

import SwiftUI

struct FFViewPadding: View {
    var body: some View {
        List {
            Section {
                // 不带任何参数使用，Text("Hello, SwiftUI!")的padding的设定是在上下左右所有的边上
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, SwiftUI!")
                        .padding()
                    Text("Hello, FF!")
                    Text("Hello, BBLv!")
                }
            }
            
            Section {
                //添加参数，自动移填充位置
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, SwiftUI!")
                        .padding(.bottom)
                    Text("Hello, FF!")
                }
            }
            
            Section {
                //添加参数，所有边的填充量
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, SwiftUI!")
                        .padding(100)
                    Text("Hello, FF!")
                    Text("Hello, BBLv!")
                }
            }
            
            Section {
                // 添加参数，位置和距离同时添加
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, SwiftUI!")
                        .padding(.bottom, 100)
                    Text("Hello, FF!")
                }
            }
        }
    }
}

#Preview {
    FFViewPadding()
}
