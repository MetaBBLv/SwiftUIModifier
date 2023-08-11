//
//  FFFormPicker.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/9.
//
//  Form 中的picker
//  SwiftUI的picker在Form中有特殊的行为，会根据你使用的平台自动调整，在iOS上，picker将被折叠成一个单独的列表行，以弹出菜单的形式显示所有可用的选项。

import SwiftUI

struct FFFormPicker: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]
    
    var body: some View {
        NavigationStack {
            Form {
                //在iOS上，这将标识一个单独的列表行出现，可以点击它来显示所有的选项--"Mild", "Medium", "Mature"
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                }
                //如果想禁用此行为，使用pickerStyle(.wheel)修饰符强制选择器使用常规样式
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle("Select your choose")
        }
    }
}

#Preview {
    FFFormPicker()
}
