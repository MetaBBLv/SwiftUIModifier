//
//  FFPresentSheetsMultiple.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/17.
//
//  Sheets多重present
//  如果你想在SwiftUI中显示多个View页面，通过从第一个View-present第二个视图来实现，不可以将两个sheet()修饰符同时附加到一个父视图上。
//  相反，将一个Sheet()修饰符放在前一个sheet中

import SwiftUI

struct FFPresentSheetsMultiple: View {
    @State private var showingFirst = false
    @State private var showingSecond = false
    
    var body: some View {
        VStack {
            Button("Show First Sheet") {
                showingFirst = true
            }
        }
        .sheet(isPresented: $showingFirst) {
            Button("Show Second Sheet") {
                showingSecond = true
            }
            .sheet(isPresented: $showingSecond) {
                Text("Second Sheet")
            }
        }
        
        //使用这种方法，两个Sheet都将正确显示。
        //如果你把两个Sheet()修饰符放在同一个父元素中，SwiftUI会失效，只显示第一个sheet
    }
}

#Preview {
    FFPresentSheetsMultiple()
}
