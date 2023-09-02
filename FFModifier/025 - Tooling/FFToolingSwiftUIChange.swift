//
//  FFToolingSwiftUIChange.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/2.
//
//  如何查找那些数据更改导致SwiftUI视图更新
//SwiftUI提供了一个特殊的、仅供调试的方法，可以使用它来识别导致视图重新加载自身的更改。该方法专门用于调试，不应在body实际程序中声明。但是在check视图正在重复调用属性还不确定原因时使用。
//该方法是Self._printChanges()，并且应在属性内部调用。着意味着你可能展示需要添加显示返回来发挥常规的代码视图。

import SwiftUI

class EvilStateObject: ObservableObject {
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if Int.random(in: 1...5) == 1 {
                self.objectWillChange.send()
            }
        })
    }
}

extension ShapeStyle where Self == Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct FFToolingSwiftUIChange: View {
    @StateObject private var eviObject = EvilStateObject()
    
    var body: some View {
        let _ = Self._printChanges()
        
        //通过设置背景色可以直观的观察body视图属性何时被调用。现象是如果Body被多次调用，那么视图背景色也会改变多次
        Text("META BBLV")
            .background(.random)
    }
}

#Preview {
    FFToolingSwiftUIChange()
}
