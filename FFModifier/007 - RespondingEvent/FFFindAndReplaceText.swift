//
//  FFFindAndReplaceText.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何让用户查找和替换文本
//  SwiftUI的TextEditor内置支持用户搜索文本，或根据需要进行搜索和替换。对于链接了键盘的用户来说，更简单。

import SwiftUI

struct FFFindAndReplaceText: View {
    @State private var bio = "Describe yourself."
    @State private var bio1 = "Describe yourself 1."
    @State private var bio2 = "Describe yourself 2."
    @State private var isShowingFindNavigator = false
    
    var body: some View {
        //点击激活TextEditor，然后按cmd+f进行搜索。查找和替换仅适用于TextEditor，而不适用于TextField
        NavigationStack {
            TextEditor(text: $bio)
                
            
            Divider()
            
            TextEditor(text: $bio1)
                .findNavigator(isPresented: $isShowingFindNavigator)
                .toolbar(content: {
                    Button("Toggle Search") {
                        isShowingFindNavigator.toggle()
                    }
                })
            
            //当当前没有TextEditor接受输入时，将true传递给findNavigator()将使系统尝试自动查找和激活一个。如果从系统中有多个可选择时，系统将为你选择一个。
            //如果你明确虚妄视图选择退出搜索或替换，请使用一个或两个findDisabled()和replaceDisabled()
            TextEditor(text: $bio2)
                .replaceDisabled()
        }
        .navigationTitle("Edit Bio")
        //对于没有硬件键盘的用户，你可以使用findNavigator()修饰符以编程的方式显示查找接口
    }
}

#Preview {
    FFFindAndReplaceText()
}
