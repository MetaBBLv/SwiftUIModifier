//
//  FFCreateModifiers.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何为UIViewRepresentable结构创建修饰符
//  将UIView包装在UIViewRepresentable结构中是将现有UIKit引入SwiftUI工程的方式，甚至可以添加自定义修饰符来调整视图在运行时的状态。
//  要实现这个需求，应该为要在底层UIView上调整的所有值创建私有属性，然后创建方法来调整它们，这些方法中的每一个都可以获取SwiftUI可表示副本（而不是底层UIView），然后调整自己创建的私有属性来更新状态。
//  完成后，SwiftUI将确保触发updateUIView()函数，此时你将私有属性复制到UIView中以确保更新。

import SwiftUI

//例如，创建一个UIViewRepresentable将UISearchBar桥接到SwiftUI，但你可能希望它的某些方面是可定制的，例如她的占位符文本。首先，创建可表示对象，并为其占位符添加一个额外的私有属性。
struct SearchField: UIViewRepresentable {
    @Binding var text: String
    private var placeholder = ""
    
    init(text: Binding<String>) {
        _text = text
    }
    
    func makeUIView(context: Context) -> some UIView {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let view: UISearchBar = uiView as! UISearchBar
        view.text = text
        view.placeholder = placeholder
    }
}
//创建修饰符调整私有属性
extension SearchField {
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}

//使用placeholder()修饰符创建了一个SearchField视图，但每次单机按钮时，会随机化占位符
struct FFCreateModifiers: View {
    @State private var text = ""
    @State private var placeHolder = "Hello, wrold"
    var body: some View {
        VStack {
            SearchField(text: $text)
                .placeholder(placeHolder)
            //每次按下时随机更换占位符
            Button("Tap me") {
                placeHolder = UUID().uuidString
            }
        }
    }
}

#Preview {
    FFCreateModifiers()
}
