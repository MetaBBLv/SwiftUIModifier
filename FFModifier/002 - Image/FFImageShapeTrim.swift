//
//  FFImageShapeTrim.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI允许我们使用其修饰符仅绘制形状的笔画或者填充一部分trim()，该修饰符采用两个参数，开始值和结束值，范围都是0-1

import SwiftUI

struct FFImageShapeTrim: View {
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        List {
            Section {
                //绘制一个半圆
                Circle()
                    .trim(from: 0, to: 0.5)
                    .frame(width: 200, height: 200)
            }
            
            Section {
                //SwiftUI绘制其形状时0度直接位于右侧，因此如果你想更改此设置，使用修改器rotationEffect()
                Rectangle()
                    .trim(from: 0, to: completionAmount)
                    .stroke(.red, lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .onReceive(timer, perform: { _ in
                        withAnimation {
                            if completionAmount == 1 {
                                completionAmount = 0
                            } else {
                                completionAmount += 0.2
                            }
                        }
                    })
            }
        }
    }
}

#Preview {
    FFImageShapeTrim()
}
