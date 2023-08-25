//
//  FFAnimationMultiple.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何将多个动画应用到视图
//  使用SwiftUI的animation()修饰符的顺序会影响那些修饰符会被动画化。也可以添加多个animation修饰符来设置不同的动画。
//  有两种方法可以做到这一点：
//  - iOS17 新方法
//  - iOS16以及以前：旧方法


import SwiftUI

struct FFAnimationMultiple: View {
    @State private var isEnabled = false
    
    var body: some View {
        Button("Press me") {
            isEnabled.toggle()
        }
        .foregroundStyle(.white)
        .frame(width: 200, height: 200)
        .animation(.easeInOut(duration: 1)) { content in
            content
                .background(isEnabled ? .green : .red)
        }
        .animation(.easeInOut(duration: 2)) { content in
            content
                .clipShape(.rect(cornerRadius: isEnabled ? 100 : 0))
        }
    }
}

#Preview {
    FFAnimationMultiple()
}
