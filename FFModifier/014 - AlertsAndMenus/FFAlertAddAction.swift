//
//  FFAlertAddAction.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  Alert-Button如何添加action

import SwiftUI

struct FFAlertAddAction: View {
    @State private var shwoingAlert = false
    
    var body: some View {
        //你经常需要将操作附加到Button上，一边在点击按钮时执行特定的操作，要做到这一点，给你的按钮附加一个闭包，当他被点击时将被调用。
        Button("Show Alert") {
            shwoingAlert = true
        }
        .alert(isPresented: $shwoingAlert) {
            Alert(title: Text("你确定要删除数据吗？"), message: Text("这是一个不可逆操作。"), primaryButton: .destructive(Text("删除"), action: {
                print("正在删除")
            }), secondaryButton: .cancel(Text("取消")))
        }
        //如果要添加两个以上的Button，使用Sheet
    }
}

#Preview {
    FFAlertAddAction()
}
