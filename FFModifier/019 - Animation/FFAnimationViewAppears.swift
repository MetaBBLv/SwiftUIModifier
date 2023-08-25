//
//  FFAnimationViewAppears.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何在视图出现后立刻启动动画
//  如果想要一个SwiftUI视图，应该使用onApppear()修饰符来附加动画，

import SwiftUI
//创建自定扩展:即时动画
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

//即时循环动画
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autorecerses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autorecerses)
        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

struct FFAnimationViewAppears: View {
    @State var scale = 1.0
    @State var scale2 = 1.0
    
    var body: some View {
        //创建一个结合动画（放大和缩小连续），类似呼吸效果
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .onAppear(perform: {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                
                withAnimation(repeated) {
                    scale = 0.5
                }
            })
        //如果打算频繁的添加初始动画，那么使用视图协议添加扩展是很好的方式。
        //通过扩展创建动画
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale2)
            .animateForever(autorecerses: true) {
                scale2 = 0.5
            }
    }
}

#Preview {
    FFAnimationViewAppears()
}
