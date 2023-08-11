//
//  FFTextFieldDefaultFocus.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何使TextField或TextEditor具有默认focus
//  macOS上的SwiftUI提供了一个defaultFocus()修饰符，可以在视图显示后立即激活键盘，作为用户输入的第一响应者，但是，在iOS上不存在，只能使用onAppear()

import SwiftUI

struct FFTextFieldDefaultFocus: View {
    enum FocusedField {
        case firstName, lastName
    }
    
    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        //iOS写法
        
        Form {
            TextField("First name", text: $firstName)
                .focused($focusedField, equals: .firstName)
            
            TextField("Last name", text: $lastName)
                .focused($focusedField, equals: .lastName)
        }
        .onAppear() {
            focusedField = .firstName
        }
        
        //Mac写法
        Form {
            TextField("First name", text: $firstName)
                .focused($focusedField, equals: .firstName)
            
            TextField("Last name", text: $lastName)
                .focused($focusedField, equals: .lastName)
        }
        .defaultFocus($focusedField, .lastName)
    }
}

#Preview {
    FFTextFieldDefaultFocus()
}
