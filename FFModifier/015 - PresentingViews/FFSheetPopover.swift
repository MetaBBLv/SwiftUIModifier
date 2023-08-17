//
//  FFSheetPopover.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/17.
//
// 如何显示Popover视图
//  SwiftUI有一个专门的修饰器来显示弹出窗口，在iPad上显示为漂浮的气泡，在iOS上是滑动
//  要显示弹出窗口，你需要一些状态来确定弹出窗口是否可见。与alert不同，弹出窗口可以包含任何类型的视图，所以，只要把你需要的东西放在弹出窗口中就可以。

import SwiftUI

struct FFSheetPopover: View {
    @State private var showingPopover = false
    
    var body: some View {
        Button("Show Menu") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    FFSheetPopover()
}
