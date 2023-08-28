//
//  FFTextInsertImage.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何在文本中插入图像
//  SwiftUI可以使用“+”来组合文本视图，也可以使用简单的文本初始值设定项将图像直接放到文本中，

import SwiftUI

struct FFTextInsertImage: View {
    var body: some View {
        //在Helloworld中添加一个星星icon
        Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
        //文本中的图像将自动调整以匹配添加的修饰符（字体、颜色等）,要用括号将链接的内容扩起来，以确保将修饰符应用于整个链接的文本。要不只能修饰最后一个Text
        (Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
            .font(.largeTitle)
            .foregroundStyle(.blue)
        //如果没有添加额外的括号，则只会修饰最后一个Text("World")
        Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

#Preview {
    FFTextInsertImage()
}
