//
//  FFNavigationSplitViewCustomizeMax.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFNavigationSplitViewCustomizeMax: View {
    var body: some View {
        //然而，如果你愿意允许灵活性-如果你的平台支持它，现在可能只是macOS-你可以提供最小，最理想和最大的尺寸
        NavigationSplitView {
            Text("Sidebar")
                .navigationSplitViewColumnWidth(min:100, ideal: 200, max: 300)
        } content: {
            Text("Content")
                .navigationSplitViewColumnWidth(min:100, ideal: 200, max: 300)
        } detail: {
            Text("Detail")
        }

    }
}

#Preview {
    FFNavigationSplitViewCustomizeMax()
}
