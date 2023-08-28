//
//  FFCustomViewWrap.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  包装自定义UIView
//  尽管SwiftUI在提供许多UIKit的UIView子类方面做的很好，但目前还没有全部具备，可以为想要的UIView创建自定义包装器。
//  为UITextView创建SwiftUI包装器作为副文本编辑器的基础，分为四个步骤：
//1. 创建符合UIViewRepresentable的结构体
//2. 定义一个属性来存储正在使用的文本字符串
//3. 给它一个makeUIView()方法，范围TextView
//4. 添加updateUIView()方法，每当TextView的数据发生更改时都会调用该方法。

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString
    
    func makeUIView(context: Context) -> some UIView {
        UITextView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.accessibilityAttributedLabel = text
    }
}

struct FFCustomViewWrap: View {
    @State private var text = NSMutableAttributedString(string: "")
    var body: some View {
        //在SwiftUI视图中使用TextView组件
        TextView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

#Preview {
    FFCustomViewWrap()
}
