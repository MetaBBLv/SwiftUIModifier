//
//  FFCoreDataNSUserActivity.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何在SwiftUI中使用NSUserActivity
//  SwiftUI有一个专用的onContinueUserActivity()修饰符，可以捕获各种NSUserActivity类型，比如来自网络的点击、来自第三方或者Siri启动等等。在AppDelegate中使用application(_:continue:restorationHandler:)处理过这个问题，但SwiftUI方法更简单的处理这个问题。
//  药实现这个需求，首先要创建一个函数并接受参数NSUserActivity，但是，不需要在App结构体中执行此操作。

import SwiftUI

struct FFCoreDataNSUserActivity: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFCoreDataNSUserActivity()
}
