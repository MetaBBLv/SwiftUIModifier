//
//  FFSheetReview.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//
//  如何让用户Review你的app(失败的case)
//  如果导入StoreKitdaoSwiftUI应用中，可以获得一个requestReview的环境变量来访问Appstore，可以提示用户应用内评价。
//  要使用它，首相将StoreKit导入，将环境变量作为属性添加到视图中，然后在想要调用的地方调用他。

import SwiftUI
import StoreKit

struct FFSheetReview: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Button("请给应用题一个评价吧") {
            requestReview()
        }
        
    }
}

#Preview {
    FFSheetReview()
}
