//
//  FFViewhideSystemUI.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何隐藏主页指示器和其他系统UI
//  SwiftUI的persistentSystemOverlays修饰符可以让我们显示或隐藏所谓的“非瞬态系统视图”，这些视图会自动放置在我们的UI上，比如Apple的主页指示器、iPad上的多任务指示器的名称

import SwiftUI

struct FFViewhideSystemUI: View {
    var body: some View {
        Text("This needs to take up lots of space")
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.yellow)
            .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    FFViewhideSystemUI()
}
