//
//  FFLabel.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 有一个专属的视图类型，用于并排显示文本和图标，这对于菜单、列表非常有用

import SwiftUI

struct FFLabel: View {
    var body: some View {
        
        List {
            Section {
                Label("Your Account", systemImage: "folder.circle")
                
                Label("Welcome to the app", image: "chincoteague")
                
                //可以使用修改器并行缩放文本和图标font()
                Label("Your Account", systemImage: "person.crop.circle")
                    .font(.title)
            }
            
            Section {
                // labelStyle()可以使用.titleOnly、.iconOnly和.titleAndIcon来控制标签的显示方式
                Label("Text Only", systemImage: "heart")
                    .font(.title)
                    .labelStyle(.titleOnly)
                
                Label("Icon Only", systemImage: "star")
                    .font(.title)
                    .labelStyle(.iconOnly)
                
                Label("Both", systemImage: "paperplane")
                    .font(.title)
                    .labelStyle(.titleAndIcon)
            }
            
            Section {
                Label {
                    Text("Paul Hudson")
                        .foregroundStyle(.primary)
                        .font(.largeTitle)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                } icon: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: 64, height: 64)
                }
            }
        }
    }
}

#Preview {
    FFLabel()
}
