//
//  FFViewInsertSafeArea.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用自定义内容插入safeArea
//  SwiftUI提供了一个safeAreaInset修饰符，允许我们将内容放置在安全区域之外，同时还可以让其他视图调整其布局，使其内容保持可见，以确保所有的内容都可以按照预期显示在屏幕上。这与ignoresSafeArea不同，后者只是扩展视图边缘。

import SwiftUI

struct FFViewInsertSafeArea: View {
    var body: some View {
        //在iOS15.2之前，这只适用于ScrollView，在15.2之后，List和Form也可以用
        /**
         NavigationStack {
             List(0..<100) { i in
                 Text("Row \(i)")
             }
             .navigationTitle("Select a row")
             .safeAreaInset(edge: .bottom, spacing: 100) {
                 Text("Outside Safe Area")
                     .font(.largeTitle)
                     .foregroundStyle(.white)
                     .frame(maxWidth: .infinity)
                     .padding()
                     .background(.indigo)
             }
         }
         */
        
        //你还可以向safeArea内容添加对其方式
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Select a row")
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Button {
                    print("Show help")
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .symbolRenderingMode(.multicolor)
                        .padding(.trailing)
                }
                .accessibilityLabel("Show help")
            }
        }
    }
}

#Preview {
    FFViewInsertSafeArea()
}
