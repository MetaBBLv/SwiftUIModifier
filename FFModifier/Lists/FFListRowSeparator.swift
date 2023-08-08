//
//  FFListRowSeparator.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何调整list-row分隔符insets(失败案例)
//  SwiftUI自动调整列表的插入，以便分隔符对齐到文本前缘，提供了对齐方式，listrowsseparatortrailing,可以自定义

import SwiftUI

struct FFListRowSeparator: View {
    var body: some View {
        List(0..<51) { i in
            Section {
                //
                Label("Row \(i)", systemImage: "\(i).circle")
                    .alignmentGuide(.listRowSeparatorLeading, computeValue: { dimension in
                        dimension[.leading]
                    })
            }
            
//            Section {
//                //还可以自定义列表行分隔符的后缘，既可以在插入的前导行分隔符之外，也可以在其位置上。例如，以下代码通过将尾随分隔符对齐到内容的边缘来单独保留前导分隔符，从而使行分隔符仅位于行文本的下方:
//                Label("Row \(i)", systemImage: "\(i).circle")
//                    .alignmentGuide(.listRowSeparatorTrailing, computeValue: { dimension in
//                        dimension[.trailing]
//                    })
//            }
        }
    }
}

#Preview {
    FFListRowSeparator()
}
