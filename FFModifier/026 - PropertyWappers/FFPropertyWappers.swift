//
//  FFPropertyWappers.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/5.
//
//  了解Swift和SwiftUI中的属性包装器
//  SwiftUI严重依赖属性包装器来使我们的代码更易于阅读、编写和维护。即使以前不了解或者未使用过，但是在SwiftUI中有很多的@和$符号，你可能会很疑惑这是干嘛的？
//属性包装器在Swift 5.1中引入的通用Swift功能，但相比于Swift，在SwiftUI中更加的常见，比如@Published、@ObservedObject和@EnvironmentObject等等，这都都是。
//属性包装器的基本情况：
//- 一些属性包装器可以实现原本不可能实现的效果，例如@State可以修改结构体的内部属性。
//- 某些属性包装器特别要求在其他地方完成额外的工作，如果该工作未完成，则可能会使应用程序崩溃。例如@FetchRequest的使用前提将CoreData的托管对象context放入环境中。
//- 一次只能使用一个属性包装器，那么@ObservedObject @Binding var value = SomeClass()是错误的声明。
//- 尽管有些属性包装器看起来非常相似，但是作用是不同的，要在正确的场景使用它们，比如@Environment和@EnvironmentOjbect
//- 在某些特定情况下，还可以创建自己的属性包装器。

import SwiftUI

struct FFPropertyWappers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWappers()
}
