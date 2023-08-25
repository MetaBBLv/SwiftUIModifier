//
//  FFAnimationDelay.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  动画延迟
//  当你想创建任何动画时（隐式、显示、绑定），可以给动画附加修饰符来调整。例如，如果想让动画在一定的时间后开始，那么就需要使用delay()修饰符。

import SwiftUI

struct FFAnimationDelay: View {
    @State private var rotaitonDelay = 0.0
    
    var body: some View {
        //例如，创建一个红色矩形，当点击时，在1s后在2s时间内旋转360度。
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotaitonDelay))
            .animation(.easeInOut(duration: 3).delay(1), value: rotaitonDelay)
            .onTapGesture {
                rotaitonDelay += 360
            }
    }
}

#Preview {
    FFAnimationDelay()
}
