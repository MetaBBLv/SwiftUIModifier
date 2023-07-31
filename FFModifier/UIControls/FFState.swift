//
//  FFState.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
// state的工作原理
/**
 SwiftUI中的`@State`是一个属性包装器，用于在视图中存储和管理可变的状态。使用@State属性包装器声明的变量在属性值改变时自动触发视图的重新渲染。`@State`属性包装器是SwiftUI中用于管理视图内部可变状态的重要机制，它确保了视图与状态的一致性，在界面交互中能够方便地更新和响应状态的变化。

 工作原理如下：

 1.  **声明状态属性**：使用`@State`属性包装器将属性声明为状态属性。例如：`@State private var counter = 0`。这将创建一个名为`counter`的私有状态属性，并将其初始化为0。
 1.  **视图的更新**：当使用`@State`属性的视图发生更改时，SwiftUI会自动检测这些更改，并在属性值改变时触发视图的重新渲染。这意味着如果你在视图中使用了该状态属性，当该属性的值发生变化时，视图会自动更新以反映最新的值。
 1.  **不可变性保证**：由于`@State`属性是不可变的，SwiftUI确保对状态属性的修改只能在视图内部进行。这样可以防止不同视图之间意外地修改状态，并确保状态的一致性。
 1.  **局部性**：每个`@State`属性都与特定视图实例相关联。当你在多个相同类型的视图中使用相同名称的`@State`属性时，它们是彼此独立的，互不影响。
 1.  **更新方式**：要更新`@State`属性的值，你需要使用`$`符号来访问绑定到该状态属性的变量。例如，要在视图内部更新`counter`属性，你可以使用`$counter`来获取绑定，然后进行更改。SwiftUI会在更改时自动更新相关视图。
 1.  **仅限于视图内部**：`@State`属性通常用于在视图内部共享数据，因为它们的作用范围仅限于视图本身及其子视图。对于需要在多个视图之间共享状态的情况，使用`@Binding`、`@ObservedObject`或`@EnvironmentObject`等属性包装器。
 */

import SwiftUI

struct FFState: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFState()
}
