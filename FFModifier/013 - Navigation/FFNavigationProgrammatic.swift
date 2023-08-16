//
//  FFNavigationProgrammatic.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  如何在SwiftUI中使用编程导航
//  我们可以使用SwiftUI的NavigationLink以编程的方式将新视图推送到NavigationStack，这意味着我们可以在准备好时出发导航，而不是仅当用户点击了button或cell时。
//  重要信息：编程导航有两种方法，iOS16以及更高的版本中可用的更新、更强大的选项，或早期版本中可用更旧、更简单的选项。苹果已经正式启用了就的API，所以你应该尽快离开
//  从iOS16以及更高的版本，我们可以将一系列的Hashable数据直接传递给NavigationStack，以控制那些数据当前在stack上。

import SwiftUI

struct FFNavigationProgrammatic: View {
    @State private var presentedNumbers = [1, 4, 8]
    
    var body: some View {
        //例如，跟踪正在显示的数字，并首先将1、4、8push到stack上。
        NavigationStack(path: $presentedNumbers) {
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
            }
            .navigationDestination(for: Int.self) { i in
                Text("Detail \(i)")
            }
            //当代码运行时，将看到“Detail8”，点返回看到“Detail 4”，点返回看到“Detail 1”，点返回看到List
        }
        .navigationTitle("NavigationForPath")
    }
}

#Preview {
    FFNavigationProgrammatic()
}
