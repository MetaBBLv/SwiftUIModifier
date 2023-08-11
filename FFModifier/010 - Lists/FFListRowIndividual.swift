//
//  FFListRowIndividual.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何更改耽搁list-row的颜色
//  SwiftUI有一个专用的listItmeTine修饰符来控制列表如何为其行上色。具体的行为取决于你的app运行在哪个平台上，代码一致

import SwiftUI

struct FFListRowIndividual: View {
    var body: some View {
        /**
         就像我说的，这取决于平台:

         在iOS上，图标会变成红色和绿色，而文字则保持原色。
         在macOS上，它还会将图标更改为红色和绿色，覆盖用户首选的强调色。
         在watchOS上，这将改变行背景颜色(称为“背景盘”)为红色或绿色。
         在tvOS上，它什么也做不了。
         在macOS上，你可以尊重用户的强调色，同时也可以添加你自己喜欢的列表行色调，像这样:
         */
        List(1..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .listItemTint(.preferred(i.isMultiple(of: 2) ? .red : .green))
        }
    }
}

#Preview {
    FFListRowIndividual()
}
