//
//  FFFontDynamicType.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//  如何将DynamicType与自定义Font一起使用
//  如果在iOS14或更高的版本，就可以实现自动移Font的自动缩放。但是，如果虚妄字体相对于特定动态类型进行缩放，则使用relativeTo修饰符

import SwiftUI

struct FFFontDynamicType: View {
    var body: some View {
        //使字体从24pt开始，但它会相对于Headline DynamicType字体进行缩放。
        Text("meta BBLv")
            .font(.custom("Georgia", size: 24, relativeTo: .headline))
        //如果想禁用字体的动态类型，使用fixedSize修饰符字体大小，无论动态类型如何设置都不会影响字体大小
        Text("metabblv@163.com")
            .font(.custom("Georgia", fixedSize: 24))
    }
}

#Preview {
    FFFontDynamicType()
}
