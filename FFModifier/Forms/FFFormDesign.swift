//
//  FFFormDesign.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/9.
//  基于表单设计
//  SwiftUI的From像容器一样工作，就像HStack和VStack一样，这意味着你可以根据需要在其中添加其他视图。但是，它们会自动调整某些控件的行为和样式，以便更好的适应表单环境

import SwiftUI

struct FFFormDesign: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        //例如，创建一个带有开关、分段控件和按钮的表单。
        Form {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Toggle("Enable Logging", isOn: $enableLogging)
            
            Button("Save changes") {
                print("Help me!")
            }
        }
    }
}

#Preview {
    FFFormDesign()
}
