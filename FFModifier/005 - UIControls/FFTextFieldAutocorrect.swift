//
//  FFTextFieldAutocorrect.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何使TextField文本自动更正
//  SwiftUI的TextField默认开启自动更正，这在大多数时候都是ok的，但是，如果你想禁用它，使用autocorrectionDisabled()修饰符,默认是true

import SwiftUI

struct FFTextFieldAutocorrect: View {
    @State private var name = ""
    
    var body: some View {
        TextField("输入你的名字", text: $name)
            .autocorrectionDisabled()
    }
}

#Preview {
    FFTextFieldAutocorrect()
}
