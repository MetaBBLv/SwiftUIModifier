//
//  FFModifierApp.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//

import SwiftUI

@main
struct FFModifierApp: App {
    
    //在你的应用场景中，使用UIApplicationDelegateAdaptor属性包装器来告诉SwiftUI它应该使用你的AppDelegate类作为delegate
    @UIApplicationDelegateAdaptor(Appdelegate.self) var appDelegate
    
    //将Core Data容器的托管对象context注入到SwiftUI环境中,这里使用perview使用的是假数据，如果真实情况下，使用单例进行初始化（PersistenceController.shared）
    let persistenceController = PersistenceController.preview
    //5. 最后一步是可选的，但建议使用，来确保数据完整，针对的场景是当App状态切换为后台是，应该调用save()方法，以便Core Data来保存你的更改，在SwiftUI中，通过添加一个属性到App来监听场景。
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        //每次启动时注册初始UserDefaults值
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            FFToolingInstruments()
        }
    }
    
    
    /** 关于023 - CoreData部分使用以下的Body进行测试
     func handleWechatLogin(_ userActivity: NSUserActivity) {
         if let id = userActivity.userInfo?["targetContentIdentifier"] {
             print("Found identifier \(id)")
         }
     }
     
     var body: some Scene {
         WindowGroup {
             FFCoreDataDeleteObjects()
                 .environment(\.managedObjectContext, persistenceController.container.viewContext)
                 .onContinueUserActivity("targetContentIdentifier", perform: { userActivity in
                     handleWechatLogin(userActivity)
                 })
                 
         }
         .onChange(of: scenePhase) {
             persistenceController.save()
         }
     }
     */
    
}
