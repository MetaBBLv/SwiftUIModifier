//
//  FFAccessibility.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  关于SwiftUI的Accessibility
//  默认情况下，SwiftUI引用程序具有非常高的可访问性，除非主动更改默认设置。
//  这种行为的关键是SwiftUI布局是机遇Stack的方法。将视图放在Hstack和VStack中，一切都有默认的顺序，因此系统可以大致理解布局应该如何设定。相比之下，UIKit和AutoLayout可以将视图放在任何地方，因此系统必须有效的对视图应该如何排序做出最佳猜测。
//  SwiftUI还建议我们为所有的交互添加标签，明确用途。但是，我们可以屏蔽标签，以及它们被隐藏，系统仍然会使用它们作为屏幕阅读器的饮品提示。
//因此，SwiftUI提供了很多的可访问性。然而，还有额外的工具来更好的体验来解决下面的问题：
//- 屏幕阅读器应该如何阅读内容？
//- 是否所有内容都需要阅读？
//- 如果用户不喜欢复杂的动画怎么办？
//- ...

import SwiftUI

struct FFAccessibility: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFAccessibility()
}
