//
//  FFPropertyWrapperAppStorage.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@AppStorage
//SwiftUI为从UserDefaults读取值提供了一个专门的属性包装器，当值发生更改时，它自动重新调整视图的body属性。这个属性包装器实际上会监听UserDefaults中的一个键，并在该键发生更改时刷新UI。

import SwiftUI

//监听UserDefaults的“username”key，在按下时set
struct FFPropertyWrapperAppStorage: View {
    @AppStorage("username") var username: String = "meta BBLv"
    //默认情况下，@AppStorage会监听UserDefaults.standard,也可以监听特定的应用程序组
    @AppStorage("username", store: UserDefaults(suiteName: "group.com.metaBBLv.unwrap")) var hobby: String = "metaBBLv"
    
    //@AppStore将数据写入UserDefaults，这不是安全的存储，因此，不可以使用@AppStore存储个人数据等敏感信息，非常容易提取。
    
    var body: some View {
        VStack {
            Text("欢迎：\(username)同学")
            
            Button("登陆") {
                username = "@metaBBLv"
            }
            
            Button("旧的存储方式") {
                //上述代码更改用户名将立即写入UserDefaults，并同时更新视图，如果使用旧的方式
                UserDefaults.standard.setValue("@metaBBLv", forKey: "username")
            }
        }
    }
}

#Preview {
    FFPropertyWrapperAppStorage()
}
