//
//  FFAnimationsOverride.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何用transactions重写动画
//  SwiftUI提供了一个withTransaction()函数，可以在运行时重写动画，例如删除隐式动画并用自定义内容替换他。

import SwiftUI

struct FFAnimationsOverride: View {
    @State private var isZoomed = false
    @State private var isZoomed1 = false
    @State private var isZoomed2 = false
    
    var body: some View {
        VStack {
            Button("Toggle zoom") {
                isZoomed.toggle()
            }
            Spacer()
                .frame(height: 50)
            Text("Zoom text")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .animation(.easeInOut(duration: 2), value: isZoomed)
        }
        //transactions可以覆盖现有的动画。例如，你可能决定在一个特定情况下，文本的动画以一种款素、线性的方式发生，而不是先有的动画。
        //要做到这一点，首先使用想要的动画创建一个新的Transaction实例，然后将他的disablesAnimations值设置为true，这样就可以覆盖任何的现有动画。当一切准备好时，使用withTranscation()。然后继续调整你想要要变的状态。它将使用你的Transcation被动画化。
        Spacer()
        VStack {
            Button("Toggle zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true
                
                withTransaction(transaction) {
                    isZoomed1.toggle()
                }
            }
            Spacer()
                .frame(height: 50)
            Text("Zoom text")
                .font(.title)
                .scaleEffect(isZoomed1 ? 3 : 1)
                .animation(.easeInOut(duration: 2), value: isZoomed1)
        }
        Spacer()
        //对于更多的控制，可以将transaction()修饰符附加到任何视图上。从而可以覆盖该应用在该视图的任何事物。
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true
                
                withTransaction(transaction) {
                    isZoomed2.toggle()
                }
            }
            Spacer()
                .frame(height: 50)
            Text("Zoom Text 1")
                .font(.title)
                .scaleEffect(isZoomed2 ? 3 : 1)
            Spacer()
                .frame(height: 50)
            Text("Zoom Text 2")
                .font(.title)
                .scaleEffect(isZoomed2 ? 3 : 1)
                .transaction { t in
                    t.animation = .none
                }
        }
    }
}

#Preview {
    FFAnimationsOverride()
}
