//
//  FFListForEach.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何创建一个列表或从ForEach绑定
//  SwiftUI可以直接从绑定中创建List或ForEach，然后提供内容闭包，并为我们显示的数据几乎中的每个元素提供单独的绑定。当你为每个项目显示的内容需要绑定到他的一些数据时，。
//  要使用这种方法，直接将绑定传递到列表中，

import SwiftUI

struct UserA: Identifiable {
    let id = UUID()
    let name: String
    var isContacted = false
}

struct FFListForEach: View {
    @State private var users = [
        UserA(name: "Taylor"),
        UserA(name: "Justin"),
        UserA(name: "Adele")
    ]
    var body: some View {
        List($users) { $user in
            HStack {
                Text(user.name)
                Spacer()
                Toggle("User has been contacted", isOn: $user.isContacted)
                    .labelsHidden()
            }
        }
    }
    //以这种方式使用绑定是修改列表的最有效方式，因为他不会在只有一个项更改时导致整个视图重新加载
}

#Preview {
    FFListForEach()
}
