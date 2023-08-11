//
//  FFToolbarButtons.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何创建Toolbar并向其添加按钮
//  SwiftUI的toolbar()修饰符允许我们在顶部或底部任何地方方式按钮item，但只有我们的视图嵌入到NavigationStack中时才可以。


import SwiftUI

struct FFToolbarButtons: View {
    var body: some View {
        //  如果你想吧按钮放在屏幕底部的工具栏中，使用Toolbar()，然后创建一个Toolbar item，指定位置为.bottomBar
        NavigationStack {
            Text("Hello, World!")
                .padding()
                .navigationTitle("SwiftUI")
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Press Me") {
                            print("Toolbar Bottom")
                        }
                    }
                    //要创建多个Button，使用ToolbarItemGroup而不是ToolbarItem，设置多个Button
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("First")
                        }
                        Button("Second") {
                            print("Second")
                        }
                    }
                    //如果你想在ToolbarItemGroup中间添加间隔，添加Spacer()即可
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Third") {
                            print("T")
                        }
                        
                        Spacer()
                        
                        Button("Fouth") {
                            print("Fouth")
                        }
                    }
                })
        }
        
        
    }
}

#Preview {
    FFToolbarButtons()
}
