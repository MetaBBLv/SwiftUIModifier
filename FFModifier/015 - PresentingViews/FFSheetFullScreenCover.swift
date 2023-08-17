//
//  FFSheetFullScreenCover.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/17.
//
//  如何使用fullScreenCover-present全屏视图
//  当你想要全屏的时候，SwiftUI的fullScreenCover()修饰符提供了一样显示方式，在代码中，他的工作原理几乎与Sheet一样
//  常规的工作表可以通过向下拖动来关闭，但是使用fullScreenCover-present的视图是不能的，因此，提供一种方法来dismiss新视图是要解决的问题。
//  重要：fullScreenCover()在macOS上不可用。


import SwiftUI

struct FullScreenModalView_015: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.primary.ignoresSafeArea(edges: .all)
            Button("Dismiss modal") {
                dismiss()
            }
        }
    }
}
struct FFSheetFullScreenCover: View {
    @State private var isPresented = false
    
    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView_015.init)
    }
}

#Preview {
    FFSheetFullScreenCover()
}
