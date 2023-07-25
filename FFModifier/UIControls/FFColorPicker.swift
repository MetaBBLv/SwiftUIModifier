//
//  FFColorPicker.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何通过ColorPicker选择颜色


import SwiftUI

struct FFColorPicker: View {
    @State private var bgColor = Color.red
    @State private var bgColor1 = Color.green
    var body: some View {
        
        VStack {
            ColorPicker("Set the background color", selection: $bgColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
        .padding()
        
        //默认情况下，ColorPicker支持颜色选择中的不透明度，可以禁用
        VStack {
            ColorPicker("Set the background color", selection: $bgColor1, supportsOpacity: false)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor1)
        .padding()
    }
}

#Preview {
    FFColorPicker()
}
