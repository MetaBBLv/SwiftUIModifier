//
//  FFViewSameWidthHeight.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使两个视图具有相同的宽度或高度
//  SwiftUI可以轻松创建两个相同大小的视图，无论你想要相同的高度还是宽度，通过组合修饰符fixedSize
//  在iOS上，关键时为每个要调整大小的视图提供无限量的最大宽或高度，这将自动使其拉伸以填充所有的可用空间。然后，你将其应用于fixedSize它们所在的容器，这告诉SwiftUI这些视图应该只占用它们所需要的空间。

import SwiftUI

struct FFViewSameWidthHeight: View {
    var body: some View {
        List {
            //此例子展示了两个文本视图具有相同的高度，即使文本视图长度差异很大，由于frame和fixedSize组合使用，两个文本视图都以相同大小布局的
            Section {
                HStack{
                    Text("蜀道难.")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxHeight: .infinity)
                        .background(.red)
                    Text("蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxHeight: .infinity)
                        .background(.green)
                }
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: 200)
            }
            
            Section {
                //两个视图宽度相同
                VStack {
                    Button("Log in") { }
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .clipShape(Capsule())
                    
                    Button(" Reset Password") { }
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxHeight: .infinity)
                        .background(.green)
                        .clipShape(Capsule())
                }
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
            }
                
        }
    }
}

#Preview {
    FFViewSameWidthHeight()
}
