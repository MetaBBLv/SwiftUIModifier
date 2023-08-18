//
//  FFContentUnavailableCustom.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//

import SwiftUI

struct FFContentUnavailableCustom: View {
    var body: some View {
        //如果有需求，可以对齐进行自定义，以添加用户搜索的内容
        ContentUnavailableView.search(text: "Life, the Universe, and Everything")
    }
}

#Preview {
    FFContentUnavailableCustom()
}
