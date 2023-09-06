//
//  FFPropertyWrapperState.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@State属性包装器
//SwiftUI使用@State属性包装器可以修改结构体中的值，在结构体中，由于结构体是值类型，默认情况下是不允许的。
//使用@State修饰属性时，实际上将其存储在结构体中移除，并放入由SwiftUI管理的共享缓存中。这代表SwiftUI可以根据需要销毁并重新创建结构体（这在程序运行中可能会发生很多次！），而不会丢失它正在存储的状态。

import SwiftUI

struct FFPropertyWrapperState: View {
    //由于@State的特性是存储在SwiftUI的共享缓存中，Apple建议使用@State修饰的变量最好标记为private
    @State private var prompt = "meta BBLv"
    //当然，这不是必须选项，你也可以不使用private定义
    @State var hobby = "KEEP LOVING, KEEP LIVING"
    //当使用@State修饰引用类型的时候，数据发生更改时，不会收到通知，对于不符合ObservableObject协议的类有用。
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FFPropertyWrapperState()
}
