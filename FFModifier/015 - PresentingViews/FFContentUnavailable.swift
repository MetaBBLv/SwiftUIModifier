//
//  FFContentUnavailable.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//
//  如何展示白画面的展位图
//  SwiftUI有一个专用的ContentUnavailableView视图，在没有数据的时候向用户展示非空画面。例如，在用户执行了搜索操作之后，并未搜索到内容，使用此View

import SwiftUI

struct FFContentUnavailable: View {
    var body: some View {
        //默认提供一个放大镜图标，有标题和副标题构成，用来展示用户并为搜索到具体内容
        ContentUnavailableView.search
    }
}

#Preview {
    FFContentUnavailable()
}
