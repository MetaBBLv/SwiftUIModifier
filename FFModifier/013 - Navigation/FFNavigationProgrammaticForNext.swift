//
//  FFNavigationProgrammaticForNext.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFNavigationProgrammaticForNext: View {
    @State private var presentedNumbers = [Int]()
    var body: some View {
        //这种方法很强大，因为可以在任何时候修改NavigationStack来push一个自定义视图--他是一个简单的数组，所以可以添加item，insert item，delete item或者根据显示需求做任务操作。在此代码示例中，路径数组开始为空，在点击的detail中添加了一个button，可以直接在当前detailpush（n+1）个detail
        NavigationStack(path: $presentedNumbers) {
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
                .navigationDestination(for: Int.self) { i in
                    VStack {
                        Text("Detail \(i)")
                        
                        Button("Go to Next") {
                            presentedNumbers.append(i + 1)
                        }
                    }
                }
                .navigationTitle("NavigationForNext")
            }
        }
    }
}

#Preview {
    FFNavigationProgrammaticForNext()
}
