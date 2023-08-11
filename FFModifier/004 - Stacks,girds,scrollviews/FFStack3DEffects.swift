//
//  FFStack3DEffects.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使用ScrollView和GeometryReader创建Cover Flow等3D效果
//  如果将GeometryReader与任何可以更改的视图（例如具有拖动手势或位于列表内的视图）相结合，就可以创建屏幕上看起来很棒的3D效果。GeometryReader可以读取视图的坐标，并将这些值直接输入到rotation3DEffect()修饰符中

import SwiftUI

struct FFStack3DEffects: View {
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        List {
            Section {
                //创建ScrollView，使其水平方向滑动，循环创建文本视图，然后使用rotation3DEffect()来创建Cover Flow的滚动效果
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(1..<20) { num in
                            GeometryReader(content: { geometry in
                                Text("Number \(num)")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(.red)
                                    .rotation3DEffect(.degrees(-Double(geometry.frame(in: .global).minX) / 8),axis: (x: 0.0, y: 1.0, z: 0.0))
                                    .frame(width:200, height: 200)
                            })
                            .frame(width: 200, height: 200)
                        }
                    }
                }
            }
            
            Section {
                //不一定总使用GeometryReader来实现这个效果，也可以使用DragGesture()来实现类似的效果。因此，此代码创建一个类似卡片的矩形，可以在X轴和Y轴上推动，并使用两个rotation3DEffect()修饰符来应用
                VStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 200, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(.degrees(Double(dragAmount.height)), axis: (x: 1, y: 0, z: 0))
                        .offset(dragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged({
                                    dragAmount = $0.translation
                                })
                                .onEnded({ _ in
                                    withAnimation(.spring()) {
                                        dragAmount = .zero
                                    }
                                })
                        )
                }
                .frame(width: 400, height: 400)
            }
            //按住拖动，可以考到旋转效果
        }
    }
}

#Preview {
    FFStack3DEffects()
}
