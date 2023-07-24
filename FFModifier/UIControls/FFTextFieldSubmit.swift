//
//  FFTextFieldSubmit.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  TextField的onSubmit触发时，执行action
//  SwiftUI有一个onSbumit()修饰符，可以附加到层次结构中的任何视图，并在用户完成TextField或SecureField中输入文本后运行你的action
import SwiftUI

struct FFTextFieldSubmit: View {
    @State private var password = ""
    @State private var username = ""
    var body: some View {
        List {
            Section {
                //用户名、密码输入之后，按确认键运行action
                SecureField("Password", text: $password)
                    .onSubmit {
                        print("Authenticating.....")
                    }
            }
            
            Section {
                //对于Form表单中所有的值进行check，这样使填写表单更佳方便
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .frame(height: 200)
                .onSubmit {
                    guard username.isEmpty == false && password.isEmpty == false else { return }
                    print("Authenticating")
                }
            }
        }
    }
}

#Preview {
    FFTextFieldSubmit()
}
