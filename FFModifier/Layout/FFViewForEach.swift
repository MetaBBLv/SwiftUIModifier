//
//  FFViewForEach.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用ForEach在循环中创建视图
//  在SwiftUI中，使用ForEach来循环创建视图。重点提示：SwiftUI中的ForEach与Swift中不同。ForEach在SwiftUI中，它本身就是一个视图结构，这意味着如果需要，你可以直接从视图主题返回他。你为其提供一个项目数组，并且你可能还需要告诉SwiftUI如何逐一的识别每一个项目，以便它知道如何在值更新时更新它们。你还可以向其传递一个要运行的函数，以便为循环中的每个项目创建视图。

import SwiftUI

//如果数组中有自定义类型，则应使用id类型中的任何属性来唯一表示它。例如，下面创建了一个结构体，其中id属性为UUID，这意味着它保证是唯一的。
struct SimpleGameResult {
    let id = UUID()
    let score: Int
}

//作为替代方案，可以创建一个遵守Identifiable协议的结构体，遵守此协议意味着一定要添加一个id成员变量，用来标记每个对象
struct IdentifiableGameResult: Identifiable {
    var id = UUID()
    var score: Int
}

struct FFViewForEach: View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    let results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10)
    ]
    
    let results1 = [
        IdentifiableGameResult(score: 8),
        IdentifiableGameResult(score: 5),
        IdentifiableGameResult(score: 10)
    ]
    
    var body: some View {
        List {
            Section {
                //倒计时
                //id: \.self是必须参数，以便SwiftUI剋唯一的识别数组中的每个元素，这意味着如果你添加或删除一个项目，SwiftUI确切的知道是哪一个。
                ForEach((1...10).reversed(), id: \.self) {
                    Text("\($0)...")
                }
                Text("Ready or not, here I come!")
            }
            
            Section {
                //创建一个包含三种颜色的数组，循环遍历所有颜色，并使用美中颜色的名称和颜色值来创建文本
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                        .padding()
                        .background(color)
                }
            }
            
            Section {
                //ForEach告诉SwiftUI可以通过查看属性来区分内部的视图
                ForEach(results, id: \.id) { result in
                    Text("Result: \(result.score)")
                }
            }
            
            Section {
                ForEach(results1) { result in
                    Text("Result: \(result.score)")
                }
            }
        }
    }
}

#Preview {
    FFViewForEach()
}
