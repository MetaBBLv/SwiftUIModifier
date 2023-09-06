//
//  FFPropertyWrapperBinding.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么好似@Binding
//@Binding声明一个值来自其他地方，并且应该在这两个地方共享使用。这与@ObservedObject和@EnvironmentObject不同，后者都是设计用于在多个视图之间共享引用类型。

import SwiftUI

//创建AddView视图
struct AddView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button("关闭") {
            isPresented = false
        }
    }
}

//创建了FFPropertyWrapperBinding视图，其中再创建一个包含@State的属性，用于存储一个子视图是否正在显示。
struct FFPropertyWrapperBinding: View {
    @State private var showingAddUser = false
    
    var body: some View {
        VStack {
            //代码区域
            Button("打开用户中心") {
                showingAddUser = true
            }
        }
        .sheet(isPresented: $showingAddUser) {
            //显示添加用户视图
            AddView(isPresented: $showingAddUser)
            //整个操作可以理解为FFPropertyWrapperBinding和AddView共享同一个Bool值，当他在一个地方发生变化时，也会在另外一个地方发生改变。
        }
        //这里使用showingAddUser作为sheet的isPresented参数，如果bool值更改为true时，将显示present的视图。并且被presnt的视图可以自己关闭，就需要将showingAddUser传递到present的视图。
        //期待的情况时，present出来的用户视图可以将showingAddUser设置为false，那么FFPropertyWrapperBinding视图就会隐藏它，以达到关闭当前present视图的目的。那么使用@Binding就非常完美，因为它可以在添加用户视图中创建一个属性，表示“这个值来自其他地方，并且在我们之间共享状态。”
    }
}

#Preview {
    FFPropertyWrapperBinding()
}
