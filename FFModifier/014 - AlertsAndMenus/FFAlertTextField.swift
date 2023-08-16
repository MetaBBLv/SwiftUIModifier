//
//  FFAlertTextField.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何在alert添加一个TextField上
//  SwiftUI的alert可以有一个或多个TextField或SecureField字段旁边的按钮，允许你提示用户直接输入。

import SwiftUI

struct FFAlertTextField: View {
    @State private var showingAlert = false
    @State private var name = ""
    
    @State private var isAuthentication = false
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        //例如，我们可以添加一个TextField，让用户在alert中输入自己的名字
        Button("Enter name") {
            showingAlert.toggle()
        }
        .alert("Enter your name", isPresented: $showingAlert) {
            TextField("username", text: $name)
            Button("OK", action: submit)
        } message: {
            Text("Xcode will print whatever you type")
        }
        
        //你可以添加尽可能多的字段，混合TextField和SecureText根据你的目标。例如，这显示了一个登陆提示，要求用户在alert中输入用户名和密码。
        Button("Please enter you Authentication") {
            isAuthentication.toggle()
        }
        .alert("Login in", isPresented: $isAuthentication) {
            TextField("username", text: $username)
            SecureField("password", text: $password)
            Button("OK", action: authenticate)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please enter your user and Password")
        }

    }
    
    func submit() {
        print("Your entered \(name)")
    }
    
    func authenticate() {
        if username == "metabblv" && password == "123456" {
            print("login seccessed")
        } else {
            print("login failed")
        }
    }
}

#Preview {
    FFAlertTextField()
}
