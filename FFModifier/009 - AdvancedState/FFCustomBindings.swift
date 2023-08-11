//
//  FFCustomBindings.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何创建自定义绑定
//  当使用SwiftUI的@State属性包装器时，它代表我们做了大量的工作来允许用户界面控件的双向绑定。但是，我们也可以使用Binding类型手动创建绑定，该类型可以提供自定义的get和set闭包，以便在读取和写入时运行。

import SwiftUI

struct FFCustomBindings: View {
    @State private var username = ""
    @State private var firstToggle = false
    @State private var secondToggle = false
    
    var body: some View {
        let binding = Binding {
            self.username
        } set: {
            self.username = $0
        }
        
        VStack {
            TextField("Enter your name", text: binding)
        }
        //当绑定到自定义binding实例时，你不需要在绑定名称前使用$符号，因为你已经读取了双向绑定。
        //当你希望为正在读取或写入的绑定添加额外的逻辑时，自定义绑定非常有用，你可能希望在发送值返回之前执行一些计算，或者你可能希望在值更改时采取一些额外的操作。
        
        //例如，创建两个toggle的stack，其中两个开关关闭，其中一个可以打开，但两个都不能同时打开，启动其中一个将始终禁用另外一个。
        let firstBinding = Binding {
            self.firstToggle
        } set: {
            self.firstToggle = $0
            if $0 == true {
                self.secondToggle = false
            }
        }
        
        let secondBinding = Binding {
            self.secondToggle
        } set: {
            self.secondToggle = $0
            if $0 == true {
                self.firstToggle = false
            }
        }

        VStack {
            Toggle(isOn: firstBinding, label: {
                Text("First Toggle")
            })
            
            Toggle(isOn: secondBinding, label: {
                Text("Second Toggle")
            })
        }

    }
}

#Preview {
    FFCustomBindings()
}
