//
//  FFProressViewIndeterminate.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何使ProgressView显示不确定的进度
//  ProgressView可以在不附加任何类型的绑定的情况下创建，这种情况下显示一个菊花，不带进度

import SwiftUI

struct FFProressViewIndeterminate: View {
    var body: some View {
        ProgressView("Downloading...")
    }
}

#Preview {
    FFProressViewIndeterminate()
}
