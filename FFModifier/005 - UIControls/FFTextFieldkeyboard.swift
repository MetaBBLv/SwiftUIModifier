//
//  FFTextFieldkeyboard.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何关闭TextField的键盘
//  SwiftUI在输入时自动显示键盘，但在iOS15之前，输入完成后隐藏键盘很麻烦，特别是当你使用keyboardType()的.numberPad、.decimalPad、.phonePad修饰符时。
//  在iOS15或更高版本，则可以通过聚焦和取消聚焦来激活和关闭TextField的键盘，最简单的情况是使用@FocusState属性包装器和focusable修饰符来完成：第一个存储一个bool值，用于更重第二个当前是否处于焦点状态

import SwiftUI

struct FFTextFieldkeyboard: View {
    
    enum Field {
        case firstName
        case lastName
        case emailAddress
    }
    
    @State private var name = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @State private var tipAmount = ""
    
    @FocusState private var nameIsFocused: Bool
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("输入你的名字", text: $name)
                .focused($nameIsFocused)
            
            Button("Submit") {
                nameIsFocused = false
            }
            
            Divider()
                .frame(height: 20)
            
            //更复杂的使用方法，可以通过@FocusState跟踪enum的值关注表单字段。例如，创建一个表单，包含3个文本字段，最后确认是否信息完全填入成功。
            VStack {
                TextField("Enter your first name", text: $firstName)
                    .focused($focusedField, equals: .firstName)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                TextField("Enter your last name", text: $lastName)
                    .focused($focusedField, equals: .lastName)
                    .textContentType(.familyName)
                    .submitLabel(.next)
                TextField("Enter your email Address", text: $emailAddress)
                    .focused($focusedField, equals: .emailAddress)
                    .textContentType(.emailAddress)
                    .submitLabel(.join)
            }
            .onSubmit {
                switch focusedField {
                case .firstName:
                    focusedField = .lastName
                case .lastName:
                    focusedField = .emailAddress
                default:
                    print("Creating account....")
                }
            }
            
            Divider()
                .frame(height: 20)
            //通过UIKit函数强制关闭键盘
            TextField("Tip Amount", text: $tipAmount)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Button("Submit") {
                print("Tip: \(tipAmount)")
                hideKeyboard()
            }
            
            
        }
        .padding()
        
        Spacer()
        
        
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    FFTextFieldkeyboard()
}
