//
//  FFToolingSafe.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/1.
//
//  如何使SwiftUI修饰符与@warn_unqualified_access一起使用更安全。
//  每个SwiftUI都会在某些时候犯同样的错误，遗憾的是你会不止一次犯这种错误：将.someModifier()写成someModifier(),导致程序出现EXC_BAD_ACCESS。
//  解决方案是用Swift的@warn_unqualified_access属性，这意味着如果不使用变量名或类似名称，则无法访问属性和方法。


import SwiftUI

//例如，扩展一个titleStyle()方法，向视图添加一些修饰符以使其匹配子弟你主题，那么将@warn_unqualified_access在方法签名之前使用。
extension View {
    @warn_unqualified_access
    func titleStyle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.black)
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

struct FFToolingSafe: View {
    var body: some View {
        //当使用它是，正常情况下
        Text("Meta BBLv")
            .titleStyle()
        
        //异常情况，删除掉了.
        Text("Meta BBLv Error")
            titleStyle()
        //这产生了区别，首先这是一个不合格的访问，我没有声明titleStyle()在哪里调用。所以SwiftUI假设我实际上FFToolingSafe在调用他。这意味着实际上正在调用self.padding(),因此会出现内存激增，导致出现一个无限递归视图并最终崩溃。
        
        //SwiftUI的规则是不使用@warn_unqualified_access作用在自己的修饰符上，但是我们可以为自己构建的自定义修饰符添加它，如果出现了使用错误的情况下（比如删除了"."）,这个时候SwiftUI会为你添出提示
        //- Use of 'titleStyle' treated as a reference to instance method in protocol 'View'
        //- Use 'self.' to silence this warning
    }
}

#Preview {
    FFToolingSafe()
}
