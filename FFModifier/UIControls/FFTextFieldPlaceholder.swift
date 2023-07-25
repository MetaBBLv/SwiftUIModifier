//
//  FFTextFieldPlaceholder.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何给TextField添加PlaceHolder
//  SwiftUI的TextField可以使用placeholder

import SwiftUI

struct FFTextFieldPlaceholder: View {
    @State private var emailAddress = ""
    
    //metabblv@163.com为placeholder
    var body: some View {
        List {
            TextField("metabblv@163.com", text: $emailAddress)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

#Preview {
    FFTextFieldPlaceholder()
}
