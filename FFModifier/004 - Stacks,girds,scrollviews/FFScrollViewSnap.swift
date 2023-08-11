//
//  FFScrollViewSnap.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何是ScrollView在子视图之间实现分页或滑动吸附效果
//  在SwiftUI中，ScrollView默认具有平滑的滚动效果，但是通过使用scrollTargetLayout()和scrollTargetBehavior()修饰符，可以使其自动对齐到特定的值视图或整个页面
import SwiftUI

struct FFScrollViewSnap: View {
    var body: some View {
        
        //例如，在水平滚动的视图中放置了10个远郊矩形，其中每个矩形都是一个滚动目标，因为设置了.scrollTargetBehavior()为.viewAligned，SwiftUI会自动在每个圆角矩形之间对齐
        List {
            Section {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<10) { i in
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 200, height: 100)
                        }
                    }.scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 40)
                //它使用scrollTargetLayout()是布局内的所有内容都成为滚动目标，如果你只想捕捉某些子视图，则应该将其删除，并将scrollTarget附加到各个子视图
            }
            
            Section {
                //另一种滚动定位行为是.padding，它是ScrollView根据滚动方向精确移动一个屏幕的宽度或高度
                ScrollView {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                }
                .scrollTargetBehavior(.paging)
                .frame(height: 450)
            }
        }
    }
}

#Preview {
    FFScrollViewSnap()
}
