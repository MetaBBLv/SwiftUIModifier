//
//  FFButtonRepeat.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/25.
//
//  如何创建按下时重复其动作的按钮
//  SwiftUI有一个专用的buttonRepeatBehavior()修饰符，当用户按住按钮是，他会反复出发按钮的动作。该动作的触发动作越来越快。


import SwiftUI

struct FFButtonRepeat: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        .buttonRepeatBehavior(.enabled)
        
        Divider()
        //通过shift+return来反复出发我们的按钮
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        .buttonRepeatBehavior(.enabled)
        .keyboardShortcut(.return, modifiers: .shift)
    }
}

#Preview {
    FFButtonRepeat()
}
