//
//  FFAlertSheet.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何显示Alert的Sheet
//  SwiftUI允许我们使用confirmationDialog()修饰符想用户显示一个选项。
//  要使用confirmationDialog()创建sheet，需要提供一些titleText、一个绑定来决定何时显示Action的sheet以及你是否想要相识标题文本，如果你没有指定，SwiftUI将根据上下文来为你决定。

import SwiftUI

struct FFAlertSheet: View {
    @State private var showingOptions = false
    @State private var selection = "None"
    
    @State private var showingOptions2 = false
    @State private var selection2 = "None"
    
    var body: some View {
        VStack {
            Text(selection)
            Button("Confirm paint color") {
                showingOptions = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("Red") {
                    selection = "Red"
                }
                
                Button("Green") {
                    selection = "Green"
                }
                
                Button("Blue") {
                    selection = "Blue"
                }
            }
        }
        Divider()
        //这个API对每个动作使用一个标准的SwiftUI按钮，所以你可以附加一个role，比如.desturective,让SwiftUI给它适当的上色
        //因为这个新的API更加灵活，我们可以使用ForEach将这些动作分解成一个简单的循环。
        VStack {
            Text(selection2)
            Button("Confirm paint color 2") {
                showingOptions2 = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions2, titleVisibility: .visible) {
                ForEach(["Red", "Green", "Blue"], id: \.self) { color in
                    Button(color) {
                        selection2 = color
                    }
                }
            }
        }
    }
}

#Preview {
    FFAlertSheet()
}
