//
//  FFListEditButton.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何使用EditButton对list进行编辑
//  如果已经配置了一个SwiftUI列表视图来支持删除或编辑它的项目，允许可以在某处添加一个EditButton来开启list视图的编辑模式。

import SwiftUI

struct FFListEditButton: View {
    @State private var users = ["BBLv", "Taylor", "Paul"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: { indexSet in
                    users.remove(atOffsets: indexSet)
                })
            }
            .toolbar(content: {
                EditButton()
            })
        }
    }
}

#Preview {
    FFListEditButton()
}
