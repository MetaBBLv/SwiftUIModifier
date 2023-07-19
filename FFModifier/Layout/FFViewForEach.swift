//
//  FFViewForEach.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用ForEach在循环中创建视图
// 您通常会发现需要循环序列来创建视图，而在 SwiftUI 中这是使用 ForEach 完成的。重要提示：很容易看到 ForEach 并认为它与 Swift 序列上的 forEach() 方法相同，但您将看到情况并非如此。SwiftUI 中的 ForEach 本身就是一个视图结构，这意味着如果需要，您可以直接从视图主体返回它。 您为其提供一个项目数组，并且您可能还需要告诉 SwiftUI 如何唯一地识别每个项目，以便它知道如何在值更改时更新它们。 您还可以向其传递一个要运行的函数，以便为循环中的每个项目创建视图。

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
                //id: \.self 部分是必需的，以便 SwiftUI 可以唯一地标识数组中的每个元素 - 这意味着如果您添加或删除一个项目，SwiftUI 确切地知道是哪一个。
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
