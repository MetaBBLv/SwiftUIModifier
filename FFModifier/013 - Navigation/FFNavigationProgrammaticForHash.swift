//
//  FFNavigationProgrammaticForHash.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFNavigationProgrammaticForHash: View {
    @State private var navPath = NavigationPath()
    var body: some View {
        //如果将一种很数据类型push到Stack，则可以使用单肩素组作为navigation path，但如果需要异构数据，则可以使用名为NavigationPath的特殊类型擦除包装器。这可以处理任何可hash的数据，所以你可以添加一些Staing、Int和custon struct，只要符合hashable都可以
        NavigationStack(path: $navPath) {
            Button("Jump to random") {
                navPath.append(Int.random(in: 1..<50))
            }
            
            List(1..<50) { i in
                NavigationLink(value: "Row \(i)") {
                    Label("row \(i)", systemImage: "\(i).circle")
                }
                .navigationDestination(for: Int.self) { i in
                    Text("Int detail \(i)")
                }
                .navigationDestination(for: String.self) { o in
                    Text("String detail \(i)")
                }
                .navigationTitle("NavigationForHashable")
            }
        }
        //你可以随你所欲的调整你的path--我们在哪里附加了一个value，但如果需要的话，你可以一次附加多个值，像旧的UIKit的pop到根视图控制器这样的东西，就像从你的路径中清楚所有东西一样的简单-navPath.removeLast(navpath.count)这样就可以做到。
    }
}

#Preview {
    FFNavigationProgrammaticForHash()
}
