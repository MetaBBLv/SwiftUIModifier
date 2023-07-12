//
//  FFImageDynamicColor.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
// 如何动态调整 SF Symbol的颜色
// 某些SF Symbols支持动态着色，控制范围在0-1之间

import SwiftUI

struct FFImageDynamicColor: View {
    @State private var value = 0.0
    
    var body: some View {
        
        List {
            Section {
                //部分填充的Wi-Fi
                Image(systemName: "wifi", variableValue: 0.5)
            }
            
            Section {
                Image(systemName: "aqi.low", variableValue: value)
                Image(systemName: "wifi", variableValue: value)
                Image(systemName: "chart.bar.fill", variableValue: value)
                Image(systemName: "waveform", variableValue: value)
                
                Slider(value: $value)
            }
            .font(.system(size: 72))
            .foregroundStyle(.blue)
            .padding()
        }
    }
}

#Preview {
    FFImageDynamicColor()
}
