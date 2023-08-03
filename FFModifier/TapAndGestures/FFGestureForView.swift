//
//  FFGestureForView.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何向视图添加手势
//  任何SwiftUI视图都可以附加手势识别器，而这些手势识别器又可以附加闭包，这些闭包在手势被激活时使用。

import SwiftUI

struct FFGestureForView: View {
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State private var dragCompleted = false
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
        List {
            //单击手势
            Image(.allOutDonuts)
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            scale -= 0.1
                        })
                )
            
            //LongPressGesture会识别用户何时按住视图和按住的时间。
            Image(.cheeseToastie)
                .scaleEffect(scale2)
                .gesture(
                    LongPressGesture(minimumDuration: 1)
                        .onEnded({ _ in
                            scale2 /= 2
                        })
                )
            
            ////DragGesture当用户按下视图并移动一段距离时，触发手势
            Image(.chrysanthemumTea)
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onEnded({ _ in
                            dragCompleted = true
                        })
                )
            
            if dragCompleted {
                Text("Drag Completed!")
            }
            //当DragGesture与offset修饰符结合使用时，可以调整视图到合适的位置。
            //由于在onEnded中设置了归零，所以当松开手指时，会弹回到原来的位置。
            VStack {
                Image(.cornOnTheCob)
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                dragOffset = gesture.translation
                            })
                            .onEnded({ gesture in
                                dragOffset = .zero
                            })
                    )
            }
            
        }
    }
}

#Preview {
    FFGestureForView()
}
