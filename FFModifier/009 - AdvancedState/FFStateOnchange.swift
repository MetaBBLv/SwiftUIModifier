//
//  FFStateOnchange.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何在状态改变时使用onChange()运行一些代码
//  SwiftUI可以使onChange()修饰符附加到任何视图上，当程序中的某些状态发生变化时，它将运行你想要运行的代码，因为我们不能总是把属性观察者如didSet与@State一起使用。

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding {
            self.wrappedValue
        } set: { newValue in
            self.wrappedValue = newValue
            handler(newValue)
        }

    }
}

struct FFStateOnchange: View {
    @State private var name = ""
    @State private var name1 = ""
    @State private var name2 = ""
    @State private var name3 = ""
    
    var body: some View {
        //此函数在ios17上已经改变
        TextField("Enter your name:", text: $name)
            .textFieldStyle(.roundedBorder)
            .onChange(of: name) { newValue in
                print("Name changed to \(name)!")
            }
        //如果OS在iOS17以及以后，有一个不接受参数的声明，可以直接读取属性并确保获得它的新值。
        //iOS17还提供了两外两个函数，一个接受带参数的两个闭包，一个用于旧值，一个用于新值，另一个用于确定视图第一次显示时是否应该运行action函数。
        //例如：当发生改变时，打印旧值和新值。
        TextField("Enter your name", text: $name1)
            .onChange(of: name1) { oldValue, newValue in
                print("Change from \(oldValue) to \(newValue)")
            }
        
        //当值改变时打印一条简单的消息，但是通过initial:true也会在显示视图时触发action闭包。
        TextField("Enter your name", text: $name2)
            .onChange(of: name2, initial: true) {
                print("Name is now \(name2)")
            }
        //使用initial：true是一种非常有用的整合功能的方法--而不是在onAppear()和onChange()中做一些工作，你可以一次完成所有的工作。
        //你可能更喜欢想Binding添加一个自定义扩展，这样我就可以将观察代码直接附加到绑定而不是视图上--它允许我讲观察者放在它正在观察的事物旁边，而不是在视图的其他地方附加许多onChange修饰符。
        TextField("Enter your name:", text: $name3.onChange(nameChanged(to:)))
    }
    
    //也就是说，如果这样做，请确保通过工具运行你的代码--在视图上使用onChange()将它添加到绑定中性能更高。
    func nameChanged(to value: String) {
        print("Name changed to \(name3)!")
    }
}

#Preview {
    FFStateOnchange()
}
