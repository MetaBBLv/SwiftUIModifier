//
//  FFToolbarCustomize.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何让用户自定义ToolbarButton
//  SwiftUI的工具栏允许用户自定义item，5个步骤
//1.为toolbar提供唯一的、稳定的标识符字符串。
//2.为每个可自定义toolbar的item提供唯一的、稳定的标识符字符串。
//3.在.secondaryaction类别中放置可定制的button
//4.为toolbar启用编辑器模式，以便所有的辅助操作都成为toolbar按钮
//5.“唯一、稳定”的标识符很重要，因为这是SwiftUI用来记住用户设置的--toolbar

import SwiftUI

struct FFToolbarCustomize: View {
    var body: some View {
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(id: "options") {
                    ToolbarItem(id: "settings", placement: .primaryAction) {
                        Button("Settings") {
                            print("Settings")
                        }
                    }
                    
                    ToolbarItem(id: "help", placement: .secondaryAction) {
                        Button("Help") {
                            print("Help")
                        }
                    }
                    
                    ToolbarItem(id: "email", placement: .secondaryAction) {
                        Button("Email Me") {
                            print("Email me")
                        }
                    }
                    
                    ToolbarItem(id: "credits", placement: .secondaryAction, showsByDefault: false) {
                        Button("Credits") {
                            print("Credits")
                        }
                    }
                    //默认情况下，这将使所有的次要操作button都可以单独自定义，但是如果你在ControlGroup中包装两个或更多Button，则它们将被附加用于自定义目的--用户必须同时添加或不添加
                    ToolbarItem(id: "font", placement: .secondaryAction) {
                        ControlGroup {
                            Button {
                                print("ControlGroup - 1")
                            } label: {
                                Label("Decrease font size", systemImage: "textformat.size.smaller")
                            }
                            Button {
                                print("ControlGroup - 2")
                            } label: {
                                Label("Increase font size", systemImage: "textformat.size.larger")
                            }
                        } label: {
                            Label("Font size", systemImage: "textformat.size")
                        }
                    }
                }
                .toolbarRole(.editor)
            
        }
        //如果你没有为ControlGroup添加Label，SwiftUI将为他包含的按钮使用Label
    }
}

#Preview {
    FFToolbarCustomize()
}
