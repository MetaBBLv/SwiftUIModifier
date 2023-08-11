//
//  FFCustomSubmit.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何自定义TextField、SecureField和TextEditor的submit按钮
//  默认情况下，TextField和SecureField在键盘上显示一个简单的“return”按钮，可以使用submitlabel（）修饰符让我们从一系列替代方案中进行选择

import SwiftUI

struct FFCustomSubmit: View {
    @State private var username = ""
    
    var body: some View {
        // 修改为join
        List {
            TextField("Username", text: $username)
                .submitLabel(.join)
        }
        
        /**通过submitLabel修饰符：可以选择不同的枚举：
            continue，
            done，
            go，
            join，
            next，
            return，
            route，
            search，
            send
         */
        // 适用于TextField、SecureField、TextView输入控件
    }
}

#Preview {
    FFCustomSubmit()
}
