//
//  FFSegmentedOrRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建Segment并读取值
//  SwiftUI的Picker还可以用于创建UISegmentedControl一样的分段控件，尽管它需要帮到到某种状态，并且确保为每一个segment提供一个标记，以便可以识别，segment可以时文字或图片

import SwiftUI

struct FFSegmentedOrRead: View {
    @State private var favoriteColor = 0
    @State private var favoriteColorStr = "Red"
    var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        //创建一个与favoriteColor状态属性一起使用的segment，并在下面添加一个Test，显示所选的值
        VStack(alignment: .leading) {
            Picker("What is your favrite color?", selection: $favoriteColor) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)
            
            Text("Value: \(favoriteColor)")
            
            Divider()
            
            //通过遍历创建
            Picker("What is your favrite color?", selection: $favoriteColorStr) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Text("Value: \(favoriteColorStr)")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    FFSegmentedOrRead()
}
