//
//  FFLabelHidden.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/25.
//
//  如何使用LabelsHidden()隐藏Picker、Stepper、Toggle等标签
//  SwiftUI要求我们在其控件中添加标签，通常想要隐藏这些标签，以便你可以获得更精确的UI布局。然而，隐藏标签有一种糟糕的方式和一种好方法
import SwiftUI

struct FFLabelHidden: View {
    @State private var selectedNumber = 0
    
    var body: some View {
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        .labelsHidden()
    }
}

#Preview {
    FFLabelHidden()
}
