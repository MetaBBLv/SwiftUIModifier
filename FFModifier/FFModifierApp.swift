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
    
    init() {
        //每次启动时注册初始UserDefaults值
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            FFViewScale()
        }
    }
}
