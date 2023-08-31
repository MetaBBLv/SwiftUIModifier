//
//  FFCoreDataConfigure.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  在SwiftUI中如何配置Core Data
//  如果创建一个新项目，使用的是SwiftUI并需要使用Core Data，Xcode的配置分为四步：
//1. 创建一个空的项目模版，通常以你的项目命名（FFModifier.xcdatamodeld）,和一个示例配置
//2. 添加一个Persistence.swift文件，将Core Data整齐的封装在这个地方。
//3. 使用managedObjectContext将上下文注入初始ContentView的environment中。
//4. 创建在ContentView中创建、读取和删除示例数据的示例代码。
//这是提供了在SwiftUI中使用CoreData获取request的完整能力。

import SwiftUI

//然而，如果没有使用Core Data模版，或者只是想探索Core Data模版替我们做了哪些工作？简单介绍App中设置步骤：
//1. 通过cmd+N来创建一个新文件，然后选择Data Model来创建一个Core Data模型。这个模型的名字很重要，因为要在代码中引用，我这里命名为“Main”。一旦创建了model，那么就可以在任何想要使用的位置创建实例。
//见Main.xcdatamodeld文件

//2. 打开xcdatamodeld文件并创建一个名为ProgrammingLanguage的实例，我创建了两个字符串属性：“name”和“creator”。你可以根据你的需求创建想要的任何属性了。
//见PersistenceController.swift

//3. 需要一个地方来加载和管理Core Data配置，Apple的模版通过一个PersistenceController单例实现。主要做的工作是让Core Data启动并运行，同时也为SwiftUI提供与来Contenxts的能力。

struct FFCoreDataConfigure: View {
    //4. 将Core Data容器的托管对象context注入到SwiftUI环境中
    let persistenceController = PersistenceController.shared
    //5. 最后一步是可选的，但建议使用，来确保数据完整，针对的场景是当App状态切换为后台是，应该调用save()方法，以便Core Data来保存你的更改，在SwiftUI中，通过添加一个属性到App来监听场景。
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        //通过观察这些变化来调用save
        FFCoreDataFetchRequest()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .onChange(of: scenePhase) {
                persistenceController.save()
            }
        
    }
    //该代码的内存存储部分很重要，因为Core Data配置为将信息保存到内存而不是磁盘是，这代表着Core Data中的数据被定义为临时数据，在程序关闭是会被清理。
}

#Preview {
    FFCoreDataConfigure()
}
