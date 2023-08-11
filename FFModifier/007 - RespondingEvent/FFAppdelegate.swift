//
//  FFAppdelegate.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何给SwiftUI App添加一个AppDelegate
//  SwiftUI应用启动时使用一个符合App协议的自定义结构体，但有时你可能想要回到我们曾经拥有的就的UIApplicationDelegate功能--也许是处理推送通知的注册，响应内存警告，检测时间变化等等。

import SwiftUI

//要做到这一点，首先创建一个自定义类，继承自NSObject并遵守UIApplicationDelegate协议。

class Appdelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("applicationDidFinishLaunching")
        return true
    }
}

struct FFAppdelegate: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFAppdelegate()
}
