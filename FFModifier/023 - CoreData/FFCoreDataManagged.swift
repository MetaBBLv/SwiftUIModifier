//
//  FFCoreDataManagged.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何从SwiftUI视图访问核心数据管理对象Context

import SwiftUI

struct FFCoreDataManagged: View {
    //将context作为环境变量传递给ContentView（我这里是FFCoreDataManagged），在此视图中添加一个@Environment属性来读取托管对象上下文。
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FFCoreDataManagged()
}
