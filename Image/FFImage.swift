//
//  FFImage.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// 使用Image视图在SwiftUI布局重渲染图像。它可以从你的Bundle、系统图标、UIImage等加载图像

import SwiftUI

struct FFImage: View {
    var body: some View {
        
        List {
            Section {
                //如果使用Xcode15构建，则可以从Bundle加载图像病使用内置静态属性将其显示在图像视图中
                Image(.fullEnglishThumb)
                    .resizable()
                    .scaledToFit()
                //如果是Xcode14以及一下，则需要饮用图像名称以字符串的方式
                Image("full-english-thumb")
            }
            
            Section {
                //你还可以从现有的UIimage加载，因为UIImage的初始化会默认加载一个named，并且返回一个可选图像，但是你需要确定这个named存在你的资产目录中
                Image(uiImage: UIImage(named: "corn-on-the-cob-thumb")!)
            }
            
            Section {
                //如果你要使用Apple的SF Symbols图标集，你应该使用Image(SystemName:)
                Image(systemName: "cloud.heavyrain.fill")
                    .font(.largeTitle)
                //* 注意：使用fong修饰符来调整SF符号，就跟文本一样
            }
        }
    }
}

#Preview {
    FFImage()
}
