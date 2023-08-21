//
//  FFViewAccent.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何调整视图的强调色
//  iOS使用淡色调给应用程序一个协调的主题，在SwiftUI中也有相同的功能，名为accent。就像在UIkit中，当你设置一个视图的accent会影响它里面的所有视图，如果你设置顶层空间的访问色，那么所有的东西都有颜色。

import SwiftUI

struct FFViewAccent: View {
    var body: some View {
        VStack {
            Button("Press Here") {
                print("Button pressed!")
            }
        }
        .accentColor(.orange)
    }
}

#Preview {
    FFViewAccent()
}
