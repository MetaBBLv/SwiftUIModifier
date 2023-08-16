//
//  FFMenuPick.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何让用具从菜单中选择options
//  SwiftUI的Picker视图有一个名为.munu的专用样式，它显示了一个弹出式菜单的选项，选择器的标签显示为一个可点击的按钮。菜单本身将在当前选择的选项旁边自动显示一个复选标记，并可以根据选择器在屏幕上的位置向上或向下显示。

import SwiftUI

struct FFMenuPick: View {
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        VStack {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            
            Text("Selected color: \(selection)")
        }
    }
}

#Preview {
    FFMenuPick()
}
