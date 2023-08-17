//
//  FFSheetViewDismiss.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/17.
//
//  被Sheet的视图如何dismiss
//  当你使用一个Sheet显示了一个SwiftUI视图时，通常想要在某些事情完成后关闭那个视图。例如当用户点击一个按钮时。在SwiftUI中有两种解决这个问题的方法。


import SwiftUI
//  第一个方法时告诉视图使用它自己的Presentation mode的环境变量来关闭。任何视图都可以关闭自己，不管时它是如何present的。使用@Environment(\.dismiss)。
struct DismissingView_015_01: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("Dismiss me") {
            dismiss()
        }
    }
}

//另外一种选择是将绑定传递到所显示的Detail视图中，这样他就可以将绑定值更改会false。你仍然需要在sheet视图中拥有某种state属性，但现在你把它作为绑定传递给Detail视图
//使用这种方法，斜街视图将其绑定设置为false也会更新原始视图中的状态，导致Detail视图Dismiss
struct DismissingView_015_02: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button("Dismiss me") {
            isPresented = false
        }
    }
}

struct FFSheetViewDismiss: View {
    @State private var showingDetail = false
    @State private var showingDetail2 = false
    
    var body: some View {
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView_015_01()
        }
        
        Button("Show Detail2") {
            showingDetail2 = true
        }
        .sheet(isPresented: $showingDetail2) {
            DismissingView_015_02(isPresented: $showingDetail2)
        }
    }
}

#Preview {
    FFSheetViewDismiss()
}
