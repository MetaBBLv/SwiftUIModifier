//
//  FFPropertyWrapperObservedObject.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@ObservedObject
//SwiftUI提供了@ObservedObject属性包装器，以便视图可以关在外部对象的状态，并在重要的更改发生时得到通知。它在行为上类似@StateObject，但不能用于创建对象，只能使用@ObservedObject修饰已在其他地方创建的对象，以方便共享数据。如果意外使用了@ObservedObject创建了对象，那么SwiftUI可能会意外销毁对象造成crash。

import SwiftUI

class Order: ObservableObject {
    @Published var items = [String]()
}

struct FFPropertyWrapperObservedObject: View {
    @ObservedObject var order: Order
    //Order类使用@Published修饰了items，因此当items发生更改时，他将自动发送通知，而FFPropertyWrapperObservedObject使用@ObservedObject来监听这些通知，如果没有@ObservedObject，更改通知依然会发送，但是会被当前视图忽略。
    //尽管看起来很简单，但值得深入了解一些具体细节：
    //首先，使用@ObservedObject标记的任何类型都必须符合ObservableObject协议，这意味着它必须是一个类而不是结构体，这是规定，SwiftUI要起此处必须使用class
    //其次，被观察对象专门设计用于在外部观察你的视图的对象，这意味着它可以在多个视图之间共享。@ObservedObject属性包装器将自动确保属性收到密切监视，以便重要的更改出现时重新加载使用它的任何视图。这还代表了数据必须在其他地方被创建，是被传入你的视图的。
    //第三，不是被观察的对象中所有的属性都会导致视图刷新。由你的需求决定了哪些属性更改会发送更改通知，要么使用@Published，要么自定义通知，都可以实现。符合ObservableObject协议的类型会得到一个默认的objectWillChange的发布者，可以根据需要进行自定义通知。
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FFPropertyWrapperObservedObject(order: Order())
}
