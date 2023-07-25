//
//  FFStepperOrRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建Stepper并读取值
//  SwiftUI的Stepper与UIStepper相同

import SwiftUI

struct FFStepperOrRead: View {
    @State private var age = 18
    
    var body: some View {
        
        //创建一个setpper绑定到age，取值范围0-130
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
            
            Divider()
            
            //onIncrement可以自定义闭包
            Stepper("Enter your age") {
                age += 1
            } onDecrement: {
                age -= 1
            }
            
            Text("Your age is \(age)")

        }
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    FFStepperOrRead()
}
