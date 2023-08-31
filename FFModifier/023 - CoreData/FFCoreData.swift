//
//  FFCoreData.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  在SwiftUI中使用CoreData
//  SwiftUI和CoreData作为Apple软件平台的其中两个重要组成部分，有很好的协同能力，SwiftUI有属性包装器、环境支持等等，这些都是为了确保能以最小的麻烦将Core Data集成到SwiftUI的App中。
//  在SwiftUI之前，在架构角度来看，使用Core Data的方式如下：
//- Apple建议在AppDelegate的级别创建容器，然后根据需要return
//- 一部分人喜欢使用Manager Classes
//- 还有一部分人喜欢完全抽象Core Data，以方便完全转移到Realm或其他可选项

//SwiftUI与Core Data的集成是不同的，在启动时，需要创建Core Data容器，然后将其托管对象注入到环境中，然后直接在哪里执行Request
//以下是四个特定的功能，可以帮你理解我的意思：
//1. NSManagedObject遵守ObservableObject协议，这代表可以将任何对象绑定到用户界面。
//2. 环境中有一个managedObjectContent的key，用于存储Core Data托管对象的上下文。
//3. 然后Xcode的模版将这个context主入到初始的内容视图中。
//4. 有一个@FetchRequest的属性包装器，它使用环境的托管对象上下文来获取request

//因此，在应用启动时创建一个托管对象上下文，将其附加到视图的环境中，然后使用@FetchRequest加载数据供App使用。

import SwiftUI

struct FFCoreData: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFCoreData()
}
