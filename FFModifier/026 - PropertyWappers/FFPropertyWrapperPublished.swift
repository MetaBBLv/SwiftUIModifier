//
//  FFPropertyWrapperPublished.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@Published
//@Published是SwiftUI最重要的属性包装器之一，因为可以创建可观察对象，自动在发生更改时进行通知。SwiftUI会自动监听这些更改，并重新调用依赖于数据的视图的body属性，本质上会刷新视图。
//在实际操作中，这意味着每当带有@Published标记属性的对象发生更改时，所有使用该对象的视图都会重新加载来push这些更改。

import SwiftUI

//创建一个可观察对象
class Bag: ObservableObject {
    var items = [String]()
}
//它符合ObservableObject协议，那么SwiftUI的属兔可以观察它的更改。但是，因为他的属性items并没有使用@Published标记，所以永远不会发送更改通知，这个时候，你可以自由的想数组添加数据，但不会自动更新视图。
//如果希望它可以接受通知，只需要添加@Published就好了
class BagPublished: ObservableObject {
    @Published var items = [String]()
}
//这种情况下，你不需要执行任何其他操作，@Published属性包装器实际上会为items添加一个willSet属性观察期，以便任何更改都会自动发送给观察者。
//@Published是一种选择性的方法，需要根据需求列出哪些属性更改应该发送通知，然后使用@Published修饰，默认情况下，未使用@Published创建的变量在变化时是不会引起视图的重新加载的。比如在存储缓存、内部使用属性，这些就值的更改就没必要更新视图。

struct FFPropertyWrapperPublished: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWrapperPublished()
}
