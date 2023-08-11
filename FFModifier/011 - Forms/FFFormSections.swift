//
//  FFFormSections.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/9.
//
//  将表单分解为Section
//  SwiftUI的Form通常分成几个部分时工作的最好，就像常规的内容列表一样。如何分解取决于需求，但通常情况下，根据它们的目的对他们进行分组时效果最好，如果它是一个订单页面，可能会把物品放在一组，订单放在一起，支付分一组。
//  From的section与list的section相同，这意味着可以在这两个地方重用相同的代码。所以，可以添加header/footer到section，或者两者都不用，只是在section之间获得一些屏幕上的间距。

import SwiftUI

struct FFFormSections: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        Form {
            Section {
                Picker("Select a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                 Toggle("Enable Logging", isOn: $enableLogging)
            } footer: {
                Text("Note: Enabling logging may slow down the app")
            }
            
            Section {
                Button("Save changes") {
                    print("Help me!")
                }
            }
        }
    }
}

#Preview {
    FFFormSections()
}
