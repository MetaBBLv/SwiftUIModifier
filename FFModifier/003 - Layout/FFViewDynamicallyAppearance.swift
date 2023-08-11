//
//  FFViewDynamicallyAppearance.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何根据视图大小和位置动态调整视图的外观
//  SwiftUI的VisualEffect修饰符可以让我在不使用GeometryReader的情况下读取视图的几何代理。这意味着我可以查看视图的大小和位置而不影响其布局行为
//  重要提示：此修改器专门用于视觉场景，如调整颜色或添加模糊，不能调整内容框架的计算方式以实现布局目的。它可以调整类似框架的东西，比如视图的偏移量和比例，因为它们不会影响布局
import SwiftUI

struct FFViewDynamicallyAppearance: View {
    var body: some View {
        //通过一些模糊量来模糊滚动视图中的每个视图，该模糊量时根据视图距滚动视图中心距离计算的。这一位置垂直中心附近的视图几乎没有模糊，越靠近边缘的模糊月严重
        //tips: 调用proxy.frame(in: .scrollView)在包含该视图的最内层滚动视图中查找该视图的大小
        ScrollView {
            ForEach(0..<100) { i in
                Text("Row \(i)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .visualEffect { content, proxy in
                        content.blur(radius: blurAmount(for: proxy))
                    }
            }
        }
    }
    
    func blurAmount(for proxy: GeometryProxy) -> Double {
        let scrollViewHeight = proxy.bounds(of: .scrollView)?.height ?? 100
        let ourCenter = proxy.frame(in: .scrollView).midY
        let distanceFromCenter = abs(scrollViewHeight / 2 - ourCenter)
        return Double(distanceFromCenter) / 100
    }
}

#Preview {
    FFViewDynamicallyAppearance()
}
