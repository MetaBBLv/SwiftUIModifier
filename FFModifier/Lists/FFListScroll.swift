//
//  FFListScroll.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何滚动到list中的特定行
//  如果你想通过编程让SwiftUI的List移动来显示特定的行。你应该把它嵌入到ScrollViewReader中。这在其代理商提供了一个scrollTo()方法，该方法可以移动到列表中的任意行，只需要提供id和锚点。

import SwiftUI

struct FFListScroll: View {
    var body: some View {
        ScrollViewReader(content: { proxy in
            VStack {
                Button("Jump to #50") {
                    proxy.scrollTo(50)
                }
                
                List(0..<100, id: \.self) { i in
                    Text("Example \(i)")
                        .id(i)
                }
            }
        })
    }
}

#Preview {
    FFListScroll()
}
