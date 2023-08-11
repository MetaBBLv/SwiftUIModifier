//
//  FFFormShowAndHidden.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/10.
//
//  显示和隐藏Form-rows
//  SwiftUI允许我们根据需要在表单中添加和删除项目，当你想要根据之前的选项调整可见选项列表时，这一特性可用。

import SwiftUI

struct FFFormShowAndHidden: View {
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    
    var body: some View {
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions.animation())
                
                if showingAdvancedOptions {
                    Toggle("Enable logging",isOn: $enableLogging)
                }
            }
        }
    }
}

#Preview {
    FFFormShowAndHidden()
}
