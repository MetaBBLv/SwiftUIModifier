//
//  FFConstantBindings.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何创建常量绑定
//  当制作一些UI时，或者只需要传递一个值给SwiftUI与来一些有意义的东西来展示时，使用常量绑定很有帮助，硬编码的值不会改变，但仍然可以向常规绑定一样使用。
//  例如，如果想创建一个切换开关，通常需要创建一个@State属性来保存bool值，然后在创建时将其发送到切换开关中，然而，如果只是在原型化界面，可以使用常量绑定

import SwiftUI

struct FFConstantBindings: View {
    var body: some View {
        Toggle(isOn: .constant(true), label: {
            Text("Show advanced options")
        })
        //这个开关是只读的，并且总是打开的，因为这就是使用了常量绑定，在后面接入实际数据时使用@State属性来替换他。
        //这些常量绑定有各种类型，bool、string、int等，SwiftUI会确保为每种视图类型使用正确的绑定。
    }
}

#Preview {
    FFConstantBindings()
}
