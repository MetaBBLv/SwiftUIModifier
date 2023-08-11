//
//  FFContentShape.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何使用contentShape（）控制视图的可点击区域。
//  如果你讲点击手势添加到原始的SwiftUI视图（文本或图像），则整个视图将变得可点击。如果你将点击手势添加到SwiftUI的容器视图（VStack或HStack），那么SwiftUI只会将手势添加到容器中包含内容的部分-Stack的大部分将无法点击。
//  如果你想改变点击的区域，可以使用contengShape()修饰符和你想要的形状。
import SwiftUI

struct FFContentShape: View {
    var body: some View {
        //例如，此代码创建一个包含图像、间隔和一些文本的VStack，然后使用contentShape()修饰符使整个stack可点击，而不仅仅是图像和文本。
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 50)
            Text("Meta BBlv")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Show details for user")
        }
        
    }
}

#Preview {
    FFContentShape()
}
