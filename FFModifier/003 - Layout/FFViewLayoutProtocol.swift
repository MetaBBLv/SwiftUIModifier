//
//  FFViewLayoutProtocol.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用布局协议创建自定义布局
//  SwiftUI允许我们使用协议为视图创建完全自定义的布局，我们的自定义布局可以向HStack、VStack或任何其他内置布局类型一样使用。
//  采用该Layout协议只有两个要求：1、一个方法，它返回布局的自视图需要多少空间。这将给出一个大小建议，这是父视图有多少可用的空间。这可能会被调用多次，以便SwiftUI可以看到你的容器有多灵活。2、另一个方法是把这些子视图放到你想要的地方。这将给出与第一种方法相同大小的建议，但也将给出一个特定的界限来工作-这将是你耶可以选择让这些方法缓存它们的计算，如果你做的事情特别慢，但我还没有遇到这样做的情况
//重要提示：当你给出一个大小建议时，他的宽度或高度可能包含nil值，因此，通常在天上调用repalcingUnspecifiedDimensions,以便将任何nil值替换为非nil值


import SwiftUI

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        //接受完整的建议空间，用合理的默认值替换任何nil值
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        //计算边界的半径
        let radius = min(bounds.size.width, bounds.size.height) / 2
        //求出圆上每个子视图之间的夹角
        let angle = Angle.degrees(360 / Double(subviews.count)).radians
        
        for (index, subView) in subviews.enumerated() {
            //询问这个视图的理想尺寸
            let viewSize = subView.sizeThatFits(.unspecified)
            //计算x、y的位置，时视图位于圆的边缘内
            let xPos = cos(angle * Double(index) - .pi / 2) * (radius - viewSize.width / 2)
            let yPos = cos(angle * Double(index) - .pi / 2) * (radius - viewSize.height / 2)
            //使用其自然大小（未指定），将此视图相对于我们的中心位置。
            let point = CGPoint(x: bounds.midX + xPos, y: bounds.midY + yPos)
            subView.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct FFViewLayoutProtocol: View {
    @State private var count = 16
    var body: some View {
        //我现在可以像任何其他布局类型一样使用它。例如，我可以在周围放置一些形状，使用stepper来控制显示的数量
        RadialLayout {
            ForEach(0..<count, id: \.self) {_ in
                Circle()
                    .frame(width: 32, height: 32)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Stepper("Count: \(count)",value: $count.animation(), in: 0...36)
                .padding()
        }
    }
}

#Preview {
    FFViewLayoutProtocol()
}
