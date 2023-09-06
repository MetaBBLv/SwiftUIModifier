//
//  FFPropertyWrapperGestureState.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@GestureState
// SwiftUI为我们提供了一个专门用于跟踪手势状态的属性包装器，称为@GestureState。尽管可以使用简单的@State属性包装器实现相同的效果。但@GestureState具有额外的功能，他在手势结束时将自动将属性设置回其初始值，而且通常比使用@State快得多。

import SwiftUI

struct FFPropertyWrapperGestureState: View {
    //创建一个手势，可以拖动视图。为此，先创建一个@GestureState属性，以存储视图一移动多少
    @GestureState var dragAmount = CGSize.zero
    //这具有CGSize.zero的默认值，代表当手势结束时，将自动设置会.zero
    
    var body: some View {
        Image(.fullEnglish)
            .offset(dragAmount)
            .gesture(
                DragGesture().updating($dragAmount, body: { value, state, transcation in
                    state = value.translation
                })
            )
        //代码分解：
        //- DragGesture().updating()创建了一个新的拖动手势，要求它修改存储在dragAmount中的值，这是我们的CGSize。
        //- 采用了一个带有三个参数的闭包：value、state和transaction
        //- value参数时拖动的当前数据，在哪里开始，移动了多远，预测在哪里结束等等。
        //- state参数是一个inout值，是我们的属性。因此，在此闭包内，我们应该修改state，而不是直接读取或写入dragAmount
        //- transaction参数是一个inout值，存储整个动画上下文，为此我们提供一些关于正在发生的情况的信息，比如这是否是一个连续或瞬间动画。连续动画可能是通过拖动滑块产生的，而瞬时动画可能是通过点击产生的。
        //为了使视图可以拖动，我所做的就是将当前的拖动翻译直接分配给state（在这种情况下，实际上是dragAmount），然后在offset()修改器中使用它来移动视图。
        
        //@GestureState的优点之一是它会在手势结束时自动将属性的值设置回初始值。在这中情况下，可以随意的拖动视图，一旦松开就会回归原位。
    }
}

#Preview {
    FFPropertyWrapperGestureState()
}
