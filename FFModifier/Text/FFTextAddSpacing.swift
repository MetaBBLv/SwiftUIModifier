//
//  FFTextAddSpacing.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 为我们提供了两个修饰符来控制文本试图内的字符距离，是我们能够根据需要使字母间隔更紧密或更远。两个修饰符是tracking()和kerning():都在字母之间添加间距，但tracking会将连体分开，而kerning不会，并且kerning会留下一些空白，二tracnking不会。

import SwiftUI

struct FFTextAddSpacing: View {
    @State private var amount = 50.0
    
    var body: some View {
        List {
            Section {
                // 为“Hello world”添加20个tranking，效果是字母键间隔非常大
                Text("Hello world")
                    .tracking(20)
            }
            
            // 它使用了字体“AmericanTyperwriter”中的文本“ffi”，它有一个结合的字母子和，因为tracking会将结合分开，而kerning不会，所以当调整滑块的时候，第一个文本看起来像“f fi”，第二个文本看起来像“f f i”
            Section {
                // 如果想真正了解tracking调整与kerning有何不同：
                Text("ffi")
                    .font(.custom("AmericanTyperwriter", size: 72))
                    .kerning(amount)
                Text("ffi")
                    .font(.custom("AmericanTyperwriter", size: 72))
                    .tracking(amount)
                
                Slider(value: $amount, in: 0...100) {
                    Text("Adjust the amount of spacing")
                }
            }
        }
    }
}

#Preview {
    FFTextAddSpacing()
}
