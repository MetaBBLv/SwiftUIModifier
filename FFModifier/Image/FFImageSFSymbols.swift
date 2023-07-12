//
//  FFImageSFSymbols.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI的Image视图允许我们加载SF Symbols中2400图标中的任意一个，其中的很多图标也可以使用多色

import SwiftUI

struct FFImageSFSymbols: View {
    var body: some View {
        
        List {
            //要从Apple的SF Symbols加载图标，请使用Image(systemName:),传入要加载的图标字符串
            Image(systemName: "moon.stars.fill")
            //Image通过systemName方式初始化返回的结果是可以缩放和着色的
            Image(systemName: "wind.snow")
                .font(.largeTitle)
            //foregroundStyle,对图像着色
            Image(systemName: "cloud.heavyrain.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            //如果你使用的图像包含颜色，则可以使用多色模式.renderingMode(.original)
            Image(systemName: "cloud.sun.rain.fill")
                .renderingMode(.original)
                .font(.largeTitle)
                .padding()
                .background(.black)
                .clipShape(Circle())
            
            //你可以选择将foregroundStyle()修饰符用于多色SF Symbols，这样的话，符号的部分重新着色
            Image(systemName: "person.crop.circle.fill.badge.plus")
                .renderingMode(.original)
                .foregroundColor(.blue)
                .font(.largeTitle)
        }
    }
}

#Preview {
    FFImageSFSymbols()
}
