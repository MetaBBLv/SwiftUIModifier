//
//  FFPickerOrRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建Picker并读取值
//  SwiftUI的Picker将UIPickerView、UISegmentedControl和UITableView合二为一，同时还适应其他OS上的样式。与大多数其他空间一样，你必须将picker附加到某中撞来来跟踪picker的选择。例如，创建一个colors数组和一个整数来存储选择的颜色，然后将其与选择器和文本殊途一起使用。

import SwiftUI

struct FFPickerOrRead: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    
    var body: some View {
        VStack {
            Picker("Plaease choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            
            Text("Your selected: \(selectedColor)")
        }
    }
}

#Preview {
    FFPickerOrRead()
}
