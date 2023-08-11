//
//  FFTabViewEnbedViews.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何使用TabView在tabbar中嵌入视图
//  SwiftUI的TabView提供了一个等价于UITabBarCOntroller的控件，允许我们让用户使用屏幕底部的一个栏在几个活跃视图之间切换。
//  在其基本形式中，你应该为每个item提供一个图像和标题，如果你希望以编程方式控制哪个item是active的，还可以添加一个标记

import SwiftUI

struct FFTabViewEnbedViews: View {
    @State var selectedView = 4
    var body: some View {
        //例如，创建两个具有不同图像、表土和标签的视图。
        TabView(selection: $selectedView) {
            Text("First View")
                .padding()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(1)
            Text("Second View")
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(2)
            //除了分指定文本和图像，还可以使用Label视图将它们组合在一起。
            Text("Third View")
                .padding()
                .tabItem {
                    Label("Third", systemImage: "3.circle")
                }
                .tag(3)
            //从iOS15开始，不用明确的请求SF Symbols图标的填充变化，因为系统会自动填充
            //如果添加label，则可以通过修改item视图的选择以编程方式控制active的item。
            //例如，把每个item的content中添加一个Button来模拟点击，通过添加一些新的状态来跟踪哪个item是活跃的，然后将其附加到TabView的tag
            Button("Show Five View") {
                selectedView = 5
            }
            .padding()
            .tabItem {
                Label("Third", systemImage: "4.circle")
            }
            .tag(4)
            
            Button("Show Four View") {
                selectedView = 4
            }
            .padding()
            .tabItem {
                Label("Third", systemImage: "5.circle")
            }
            .tag(5)
        }
        
        //只要数据类型符合Hashable，item的label可以是任何类型。整数可能是最好的，但是如果要进行任何有意义的程序化导航，则应该确保将标记放在视图的中心位置，例如静态属性。这是你可以在许多地方共享价值，从而降低出错的风险。
        
    }
}

#Preview {
    FFTabViewEnbedViews()
}
