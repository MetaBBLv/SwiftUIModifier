//
//  FFAnimateBindingValues.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  通过绑定值来监听动画变化
//  SwiftUI的双向绑定可以调整程序的状态，我们可以通过调整视图层次来做出相应。例如，控制一些文本的隐藏或者视图的透明度等等。
//  可以通过在绑定中添加animation()，而不是让状态立即发生变化，从而为绑定修改引起的变化过程制作动画。

import SwiftUI

struct FFAnimateBindingValues: View {
    @State private var showingWelcome = false
    @State private var showingWelcome1 = false
    @State private var showingWelcome2 = false
    
    var body: some View {
        //例如，创建一个开关，切换状态来控制视图的显示和隐藏。
        Toggle("Toggle label - normal", isOn: $showingWelcome)
            .padding()
        
        if showingWelcome {
            Text("Hi, metaBBLv")
        }
        //如果没有动画，文本视图在点击的时候立即出现/消失，这将导致视觉跳动。如果修改这个切换，将它绑定到$showingWelcome,那么文本视图将平滑的出现。
        Toggle("Toggle label - animation", isOn: $showingWelcome1.animation())
            .padding()
        
        if showingWelcome1 {
            Text("Hi, metaBBLv - animation")
        }
        //如果想要更丰富的动画效果，可以给animation()传递参数来控制，比如，添加一个spring()动画
        Toggle("Toggle label - animation(spring)", isOn: $showingWelcome2.animation(.spring))
            .padding()
        
        if showingWelcome2 {
            Text("Hi, metaBBLv - animation(spring)")
        }
    }
}

#Preview {
    FFAnimateBindingValues()
}
