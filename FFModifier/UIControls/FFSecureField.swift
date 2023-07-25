//
//  FFSecureField.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何使用SecureField创建加密TextField
//  SwiftUI的SecureField的原理与TextField几乎相同，只是为了保护隐私而屏蔽了字符。

import SwiftUI

struct FFSecureField: View {
    @State private var password: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            SecureField("Enter a password", text: $password)
            Text("Your entered: \(password)")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    FFSecureField()
}
