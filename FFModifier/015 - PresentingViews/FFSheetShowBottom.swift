//
//  FFSheetShowBottom.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//
//  如何显示一个bottom-sheet
//  SwiftUI的presentationsDetents()修饰符可以创建从视图底部向上滑动的Sheet，可以不占满全屏，至于多少，根据需求来控制。

import SwiftUI

struct FFSheetShowBottom: View {
    @State private var showingCredits = false
    @State private var showingCredits2 = false
    @State private var showingCredits3 = false
    @State private var showingCredits4 = false
    @State private var showingCredits5 = false
    let heights = stride(from: 0.1, to: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        Button("Show Credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("This app was brought to you hacking with Swift")
                .presentationDetents([.medium, .large])
        }
        Divider()
        //同时支持.medium和.large，SwiftUI将创建一个调整大小的句柄，让用户在这两个size之间调整表单。如果不想这样做，可以将presentationDragIndicator(.hidden)添加到sheet
        Button("Show Credits 2") {
            showingCredits2.toggle()
        }
        .sheet(isPresented: $showingCredits2) {
            Text("This app was brought to you hacking with Swift")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.hidden)
        }
        Divider()
        //如果不要求任何延迟，则默认为.large
        //及时有自定义的显示控件，当有一个高度比较小的class时，sheet也会自动占据整个屏幕。比如，横向的iPhone。如果想支持吃场景，请确保提供一种方法来关闭sheet view。
        //除了指定一个内置大小外，还可以提供一个范围为0-1的自定义分数。例如，创建一个占用屏幕底部15%的sheet View
        Button("Show Credits 3") {
            showingCredits3.toggle()
        }
        .sheet(isPresented: $showingCredits3) {
            Text("This app was brought to you hacking with Swift")
                .presentationDetents([.fraction(0.15)])
        }
        Divider()
        //或者这顶一个精确的高度
        Button("Show Credits 4") {
            showingCredits4.toggle()
        }
        .sheet(isPresented: $showingCredits4) {
            Text("This app was brought to you hacking with Swift")
                .presentationDetents([.height(300)])
        }
        Divider()
        //可以根据需要给视图附加任意多的detens，只要把他们全部添加到detens的集合中，SwiftUI会自动处理。例如，可以让用户在从10%切换到100%
        Button("Show Credits 5") {
            showingCredits5.toggle()
        }
        .sheet(isPresented: $showingCredits5) {
            Text("This app was brought to you hacking with Swift")
                .presentationDetents(Set(heights))
        }
    }
}

#Preview {
    FFSheetShowBottom()
}
