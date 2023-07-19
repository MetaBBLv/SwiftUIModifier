//
//  FFStackZ.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何使用ZStack将视图分层
//  SwiftUI有一个专用的Stack类型，用于创建重叠内容，例如，如果你想在图片上放置一些文本，它是ZStack，原理类似HStack与VStack

import SwiftUI

struct FFStackZ: View {
    var body: some View {
        List {
            //在文本下面添加一个图片
            Section {
                ZStack {
                    Image("strawberry-surprise")
                        .scaledToFit()
                    Text("Hi, BBLv!")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .background(.black)
                }
            }
            
            //通过Alignment方式创建
            Section {
                ZStack(alignment: .leading) {
                    Image("strawberry-surprise")
                        .scaledToFit()
                    Text("Hi, BBLv!")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .background(.black)
                }
            }
            //通过offset将Text添加在Image右下方
            Section {
                ZStack(alignment: .bottomTrailing) {
                    Image("strawberry-surprise")
                        .scaledToFit()
                    Text("Hi, BBLv!")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .background(.black)
                        .offset(CGSize(width: -40.0, height: -10.0))
                }
            }
        }
    }
}

#Preview {
    FFStackZ()
}
