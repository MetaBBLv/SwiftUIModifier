//
//  FFSheetSwipe.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//
//  如何防止Sheet被关掉
//  SwiftUI提供了interactiveDismissDisabled()修饰符来控制用户是否可以向下滑动来关闭一个Sheet View。例如，如果用户必须接受的协议，只用同意才能关闭。
//  最简单的方法是，interactiveDismissDisabled()修饰符附加到你的Sheet Content上。

import SwiftUI

struct ExampleSheet_015_01: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Sheet View")
            Button("Dismiss", action: close)
        }
        .interactiveDismissDisabled()
    }
    
    func close() {
        dismiss()
    }
}

struct ExampleSheet_015_02: View {
    @State private var termsAccepted = false
    
    var body: some View {
        VStack {
            Text("Terms and conditions")
                .font(.title)
            Text("Lots of legalese here")
            Toggle("Accept", isOn: $termsAccepted)
        }
        .padding()
        .interactiveDismissDisabled(!termsAccepted)
    }
}

struct FFSheetSwipe: View {
    @State private var showingSheet = false
    @State private var showingSheet1 = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: ExampleSheet_015_01.init)
        Divider()
        //如果你愿意，你可以将一个bool值绑定到修饰符，以允许swipe仅在成功满足某些条件是才取消。
        Button("Show Sheet 1") {
            showingSheet1.toggle()
        }
        .sheet(isPresented: $showingSheet1, content: ExampleSheet_015_02.init)
    }
}

#Preview {
    FFSheetSwipe()
}
