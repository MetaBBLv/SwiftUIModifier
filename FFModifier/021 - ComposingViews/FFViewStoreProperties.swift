//
//  FFViewStoreProperties.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何将视图存储为属性
//  如果有多个视图前台在另一个视图中，你可能会发现为其中一些或全部视图创建属性很重要，可以使布局代码更容易，然后，可以在视图代码中內联引用这些属性，可以保证视图结构更清晰。

import SwiftUI

struct FFViewStoreProperties: View {
    let title = Text("metaBBLv").bold()
    let subtitle = Text("Author").foregroundStyle(.secondary)
    
    var body: some View {
        VStack {
            title
            subtitle
            //像这样，只需要在stack中写入属性名就可以使用了。
            //但是更方便的是可以将修饰符附加到这些属性上进行自定义操作。
            Divider()
            title
                .foregroundStyle(.red)
            subtitle
            //这不会改变标题的基础设定，只是在基础程度上附加的一种方式。
        }
    }
}

#Preview {
    FFViewStoreProperties()
}
