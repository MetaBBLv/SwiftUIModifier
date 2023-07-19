//
//  FFScrollViewDismissKeyboard.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
// 如何在ScrollView滚动时关闭键盘
// SwiftUI的scrollDismissesKeyboard（）修饰符控制当用户在scrollView中滚动时如何关闭键盘。

import SwiftUI

struct FFScrollViewDismissKeyboard: View {
    @State private var username = "BabyLove"
    @State private var bio = ""

    var body: some View {
        //我在ScrollView中创建了一个TextField和一个TextEditor，需求时用户在滚动时以交互的方式关闭键盘
        ScrollView {
            VStack {
                TextField("Name", text: $username)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $bio)
                    .frame(height: 400)
                    .border(.quaternary, width: 1)
            }
            .padding(.horizontal)
        }
        .scrollDismissesKeyboard(.interactively)
        
        /**scrollDissmissesKeyboard()修饰符有四个可选值
            .automatic:让SwiftUI根据滚动的上下文判断最佳操作
            .immediately：使键盘在任何滚动发生时立即完全关闭
            .interactively：时键盘与用户手势同步关闭，用户需要进一步滚动才能完全关闭键盘
            .never：时键盘在滚动期间保持可见
         */
    }
}

#Preview {
    FFScrollViewDismissKeyboard()
}
