//
//  FFScenePhase.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/27.
//
//  如何使用scenePhase检测App合适移动至前台或后台
//  SwiftUI提供了一个scenePhase环境变量，当你的App在前台、后台和非活跃状态之间移动时，该环境变量会自动更新。可以在在App的任何视图中观察这些内容。

import SwiftUI

struct FFScenePhase: View {
    //添加一个属性
    @Environment(\.scenePhase) var scenePhase
    @State private var currentState = "Active"
    
    var body: some View {
        
        //可以添加在函数体中观察，也可以用onChange()直接观察
        Text(currentState)
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .inactive {
                    currentState = "Inactive"
                    print("Inactive")
                } else if newPhase == .active {
                    currentState = "Active"
                    print("active")
                } else if newPhase == .background {
                    currentState = "Background"
                    print("background")
                }
            }
        
        //App共有三种状态
        //Active：在前台，标记为活跃状态，正在使用
        //Background：在后台。
        //Inactive：在前台与后台之间，应该属于系统桌面控制状态，App可见，但是不可交互，标记为非活跃状态。在多任务窗口时最常见。
    }
}

#Preview {
    FFScenePhase()
}
