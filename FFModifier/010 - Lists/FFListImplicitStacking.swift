//
//  FFListImplicitStacking.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何使用隐式堆叠
//  如何创建一个动态列表并在每行中放置多个内容，会发生什么情况？SwiftUI的解决方案简单、灵活，并且在默认的情况下为我们提供了很好的行为：它创建了一个隐式的HStack来容纳你的项目，因此他们会自动横向布局。
// 在iOS17beta2上未实现隐式堆叠，

import SwiftUI

struct FFUser: Identifiable {
    let id = UUID()
    let username = "Anonymous"
}

struct FFListImplicitStacking: View {
    let users = [FFUser(),FFUser(),FFUser()]
    
    var body: some View {
        
        List(users) { user in
            HStack {
                Image(.chincoteague)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(user.username)
            }
        }
    }
}

#Preview {
    FFListImplicitStacking()
}
