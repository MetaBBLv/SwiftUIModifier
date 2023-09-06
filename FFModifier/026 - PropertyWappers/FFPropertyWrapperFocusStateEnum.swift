//
//  FFPropertyWrapperFocusStateEnum.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//

import SwiftUI

//如果想在多个视图之间移动键盘焦点，应该使用可选的枚举。可以将其设置为枚举中的一个案例来激活特定的输入字段，或者将其设置为nil以使没有任何字段具有焦点。在iOS上实际上是取消键盘的显示。
//因此可以创建两个文本字段来存储用户名和密码，然后使用@FocusState和onSubmit()在他们之间进行移动。

struct FFPropertyWrapperFocusStateEnum: View {
    enum FocusedFieldEnum {
        case username, passward
    }
    
    @FocusState private var focusedField: FocusedFieldEnum?
    @State private var username = "meta BBLv"
    @State private var password = "123456"
    
    var body: some View {
        VStack {
            TextField("请输入用户名", text: $username)
                .focused($focusedField, equals: .username)
            SecureField("请输入密码", text: $password)
                .focused($focusedField, equals: .passward)
        }
        .onSubmit {
            if focusedField == .username {
                focusedField = .passward
            } else {
                focusedField = nil
            }
        }
    }
}

#Preview {
    FFPropertyWrapperFocusStateEnum()
}
