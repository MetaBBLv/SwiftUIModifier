//
//  FFPropertyWrapperUIApplicationDelegateAdaptor.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@UIApplicationDelegateAdaptor
//如果需要在SwiftuI中访问AppDelegate的功能，要创建一个class，并且要继承NSObject和UIApplicationDelegate，并添加你想要的功能


import SwiftUI

//如果您想要实现旧的 didFinishLaunchingWithOptions 方法，您可以使用以下代码
class AppDelegateBBLv: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("您的代码在此")
        return true
    }
}

//一旦您创建了这个类，您可以在主 App 中使用 UIApplicationDelegateAdaptor 属性包装器，以便 SwiftUI 知道创建和管理您的应用委托类：
//@UIApplicationDelegateAdaptor(AppDelegateBBLv.self) var appDelegate
struct FFPropertyWrapperUIApplicationDelegateAdaptor: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWrapperUIApplicationDelegateAdaptor()
}
