//
//  FFToggleSwitch.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建toggle Switch
//  SwiftUI的toggle可以再true和false状态之间切换，就像UISwitch在UIKit中一样。
//  例如，创建一个toggle，根据toggle是否启用来显示或不显示消息

import SwiftUI

struct EmailList: Identifiable {
    var id: String
    var isSubscribed = false
}

struct FFToggleSwitch: View {
    @State private var showGreeting = true
    @State private var isOn = false
    
    @State var lists = [
        EmailList(id: "Monthly Updates", isSubscribed: true),
        EmailList(id: "News Flashes", isSubscribed: true),
        EmailList(id: "Spacial offers", isSubscribed: true)
    ]
    
    var body: some View {
        //定义一个@state属性包装的bool类型的值，用于存储切换的当前值，然后根据需要使用它来显示或隐藏操作。
        VStack(alignment: .leading) {
            Text("toggle基础式样")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            Toggle("Show welcome message", isOn: $showGreeting)
            
            if showGreeting {
                Text("Hi,BBLv")
            }
            //使用.toggleStyle自定义按钮颜色
            Divider()
            Text("toggle自定义颜色")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            Toggle("Show welcome message", isOn: $showGreeting)
                .toggleStyle(SwitchToggleStyle(tint: .red))
            
            //使用.toggleStyle(.button)自定义整个文字颜色
            Divider()
            Text("toggle自定义颜色")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            Toggle("Show welcome message", isOn: $isOn)
                .toggleStyle(.button)
                .tint(.mint)
            Divider()
        }
        .padding()
        
        VStack(alignment: .leading) {
            //从iOS16开始，可以将Toggle绑定到bool数组，可以批量禁用或者开启。例如，订阅
            Text("批量订阅")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            Form {
                Section {
                    ForEach($lists) { $list in
                        Toggle($list.id, isOn: $list.isSubscribed)
                    }
                }
                
                Section {
                    Toggle("Subscribe to all", sources: $lists, isOn: \.isSubscribed)
                }
            }
        }
        .padding()
        
        
        Spacer()
    }
}

#Preview {
    FFToggleSwitch()
}
