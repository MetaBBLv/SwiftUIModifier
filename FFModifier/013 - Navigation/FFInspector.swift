//
//  FFInspector.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何添加一个检查器在任何View上
//  SwiftUi的inspector()修饰符让我们可以在任何需要的地方添加检查器视图。这就像Xcode一样，检查器添加到UI的后面，并且可以根据需要与NavigationSplitView和NavigationStack一起使用。

import SwiftUI

struct FFInspector: View {
    @State private var isShowingInspector = false
    
    var body: some View {
        //当按钮被按下时，将显示一个检查器视图。
        Button("Hello, world!") {
            isShowingInspector.toggle()
        }
        .font(.largeTitle)
        .inspector(isPresented: $isShowingInspector) {
            Text("Inspector View")
        }
        //当空间很大时，比如使用全屏的iPad应用程序或macOS时，检查器就放在按钮旁边。然而，当空间有限时，例如在iPhone上，检查器作为一个页面向上滑动。
    }
}

#Preview {
    FFInspector()
}
