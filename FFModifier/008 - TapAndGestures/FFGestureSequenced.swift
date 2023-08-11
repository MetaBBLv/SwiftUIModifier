//
//  FFGestureSequenced.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何使用sequenced(before:)创建手势链
//  SwiftUI可以从其他手势中创建新手势，这使得我们仅在两个手势连续出现时才触发操作，例如，用户拖动视图然后长按它。
//  由于排序视图需要能够互相引用，因此你无法真正的将它们创建为视图的属性。相反，直接在body属性内创建它们，然后使用FirstGesture.sequenced(before:secondaryGesture)将两者链接在一起形成一个手势。

import SwiftUI

struct FFGestureSequenced: View {
    @State private var message = "Long press then drag"
    
    var body: some View {
        //拖动文本之前长按
        let longPress = LongPressGesture()
            .onChanged { _ in
                message = "Now drag me"
            }
        
        let drag = DragGesture()
            .onEnded { _ in
                message = "Success"
            }
        
        let combined = longPress.sequenced(before: drag)
        
        Text(message)
            .gesture(combined)
        //在手势发生时时同步Text。
    }
}

#Preview {
    FFGestureSequenced()
}
