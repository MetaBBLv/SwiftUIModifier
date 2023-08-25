//
//  FFAnimationFinishCallback.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  当动画完成时运行一个回调函数
//  可以选择为SwiftUI的withAnimation()函数提供完成后的回调，并在动画完成时运行代码。这可能是你调整某些程序状态的地方，但你可也一将其用作将动画连接在一起的简单方法。对一个事物进行动画处理，然后对其他事物进行动画处理

import SwiftUI

struct FFAnimationFinishCallback: View {
    @State private var scaleUp = false
    @State private var fadeOut = false
    
    @State private var scaleUp1 = false
    @State private var fadeOut1 = false
        
    var body: some View {
        //点击按钮然后放大并淡出
        Button("Tap Me!") {
            withAnimation {
                scaleUp = true
            } completion: {
                withAnimation {
                    fadeOut = true
                }
            }

        }
        .scaleEffect(scaleUp ? 3 : 1)
        .opacity(fadeOut ? 0 : 1)
        //这里有一个小蟹姐可能会让你感觉到震惊，如果你使用弹簧动画，则最后可能会出现很长的运动尾部，其中你的动画正在移动用户无法察觉的。
        //默认行为withAnimation()是认为动画完成的，及时荏苒发生微笑运动的肠胃，但如果希望100%完成，可以覆盖默认值。
        Button("Tap Me!") {
            withAnimation(.bouncy, completionCriteria: .removed) {
                scaleUp1 = true
            } completion: {
                withAnimation {
                    fadeOut1 = true
                }
            }
        }
        .scaleEffect(scaleUp1 ? 3 : 1)
        .opacity(fadeOut1 ? 0 : 1)
        //对于更复杂的效果，请考虑使用相位动画器而不是动画完成的闭包
    }
}

#Preview {
    FFAnimationFinishCallback()
}
