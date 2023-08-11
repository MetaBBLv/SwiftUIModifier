//
//  FFSliderOrRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建Slider并读取值
//  SwiftUI的Slider的原理与UISlider相似，你需要将其绑定到某处一边可以存储值。
/** 创建一个Slider需要的参数：
    value：绑定一个Double类型的数据
    in：slider的滑动范围
    Step：移动时值的变化量。
*/

import SwiftUI

struct FFSliderOrRead: View {
    @State private var celsius: Double = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Slider(value: $celsius, in: -100...100)
            Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") fahrenheit")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    FFSliderOrRead()
}
