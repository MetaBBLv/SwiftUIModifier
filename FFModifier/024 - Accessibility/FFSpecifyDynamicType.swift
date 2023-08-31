//
//  FFSpecifyDynamicType.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何指定视图支持的动态类型的大小
//  SwiftUI对动态类型的自动支持意味着视图可以根据用户的偏好放大或缩小。但是，一些情况下会超出屏幕导致UI的不一致，可以使用dyanmicTypeSize()来限制

import SwiftUI

struct FFSpecifyDynamicType: View {
    var body: some View {
        VStack {
            //与固定值一起使用，意味着视图将忽略所有动态类型的大小
            Text("This will stay small")
                .dynamicTypeSize(.xxLarge)
            //可以指定范围
            Text("This won't go above large")
                .dynamicTypeSize(...DynamicTypeSize.large)
            
            Text("This will scale within a range")
                .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.xxxLarge)
            
            Text("This will scale to any Size")
            //许多用户喜欢以来较大的动态字体来使用App。但是，随着屏幕内信息量的增加，在某些特定的场景下要限制这种特性。
        }
    }
}

#Preview {
    FFSpecifyDynamicType()
}
