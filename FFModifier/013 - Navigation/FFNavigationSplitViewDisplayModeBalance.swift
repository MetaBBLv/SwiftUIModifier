//
//  FFNavigationSplitViewDisplayModeBalance.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFNavigationSplitViewDisplayModeBalance: View {
    var body: some View {
        //第二个选项是.balanced，这将在显示侧边栏或Content栏时减少Detail视图的大小--只需将.prominentDetail切换为.balance
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
        .navigationSplitViewStyle(.balanced)
        
        
        //默认设置是.automatic，这将根据平台的不同而有所不同，在写Text是，在iPhone上变成了.prominentDetail，在iPad上变成.balance
    }
}

#Preview {
    FFNavigationSplitViewDisplayModeBalance()
}
