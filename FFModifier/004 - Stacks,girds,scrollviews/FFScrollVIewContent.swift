//
//  FFScrollVIewContent.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何缩进ScrollView中的内容或滚动指示器
//  默认情况下，SwiftUI的ScrollView允许其内容填充所有可用空间，并且滚动指示器在屏幕的尾部边缘显示，使用contentMargins()修饰符，可以调整位置，将内容或滚动指示器根据指定的数值和边缘进行内嵌调整

import SwiftUI

struct FFScrollVIewContent: View {
    var body: some View {
        List {
            Section {
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.blue)
                    }
                }
                .frame(height: 300)
                .contentMargins(50, for: .scrollContent)
            }
            
            Section {
                //可以指定单一边缘进行单独调整
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.blue)
                    }
                }
                .frame(height: 300)
                .contentMargins(.top, 50, for: .scrollContent)
            }
            
            Section {
                //调整滚动指示器，针对top，距离是50
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.blue)
                    }
                }
                .frame(height: 300)
                .contentMargins(.top, 50, for: .scrollIndicators)
            }
        }
    }
}

#Preview {
    FFScrollVIewContent()
}
