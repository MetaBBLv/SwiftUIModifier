//
//  FFViewHovering.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何检测用户鼠标悬停在视图上
//  在SwiftUI中，链接鼠标的任何macOS应用或任何iPadOs引用都可以检测用户何时将指针悬停在视图上，并做出适当的响应。
//  你需要两个修饰符: onHover()和hoverEffect()。第一个允许你跟踪指针是否悬停在视图上，并传递一个反应该状态的bool值。
import SwiftUI

struct FFViewHovering: View {
    @State private var overText = false
    var body: some View {
        //例如，这会将某些文本着色为红色或绿色，具体取决于指针是否悬停在其上。
        Text("Hello, World!")
            .foregroundStyle(overText ? .green : .red)
            .onHover { over in
                overText = over
            }
        //hideEffect修饰符可以选择系统在悬停时突出显示视图的三种方式之一：
        //highlight：将指针转换为徒刑的形状
        //lift：将指针转换为形状，放大视图并在其后面放置软阴影
        //automatic:选择最适合的高光效果。
        
        //请注意，如果你只应用不带有任何参数的hoverEffect修饰符，automatic时默认值。但它不仅仅在highhlight和lift之间进行选择，这是完全不同的效果，并且不会转换指针以匹配你的观点的形状。
        //
        Text("Tap me!")
            .font(.largeTitle)
            .hoverEffect(.lift)
            .onTapGesture {
                print("Text tapped")
            }
        //在iPad模拟器上操作，点击I/O菜单并选择输入（Input），在选将光标显示到设备（Send Pointer to Device）
    }
}

#Preview {
    FFViewHovering()
}
