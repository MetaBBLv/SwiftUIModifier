//
//  FFViewContainerSize.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何调整一个视图相对于其容器的大小
//  SwiftUI的containerRelativeFrame是一个简单但功能强大的方法，使视图有一个相对于其容器的大小，这可能是它们的整个窗口，它们在里面的滚动视图，甚至只是一个列在你的布局。你需要提供三个核心参数，你想要设置那个轴，你想要将空间划分为多少部分，以及每个视图会分到多少部分
import SwiftUI

struct FFViewContainerSize: View {
    var body: some View {
        //这告诉ScrollView中的视图，它们应该是其容器宽度的2/5
        /**需要明确的是：count参数是指ScrollView的水平空间应该分成多少部分，span参数指的是应该为每个文本视图分配多少部分，我使用5表示count，着意味着scrollView的水平空间被分为5，然后用2表示span，这意味着每个文本视图将分配2/5的空间
            这种不均匀的跨度意味着当app运行时，用户将看到2.5个视图，让用户知道scrollview后面还有视图
            如何划分取决你的参数
         关于使用容器相对框架有两个点：
            1、如果需要，可以使用多个轴 [. horizontal, .vertical]
            2、默认的对齐方式为.center，但是你可以用任何你想要的来指定自定义的对齐方式参数
         */
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { i in
                    Text("Item \(i)")
                        .foregroundStyle(.white)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10)
                        .background(.blue)
                }
            }
        }
    }
}

#Preview {
    FFViewContainerSize()
}
