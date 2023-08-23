//
//  FFDrawPolygons.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何绘制多边形和星星
//  如果了解了SwiftUI的基本路径绘制原理，就可以轻松的添加各种形状了。例如，创建一个星星，可以表示各种各样的图形，甚至多边形，通过一些数学模型。

import SwiftUI

struct Star: Shape {
    //存储星星有多少个角，以及它的平滑度
    let corners: Int
    let smoothness: Double
    
    func path(in rect: CGRect) -> Path {
        //首先要保证绘制的路径上至少有两个角，否则路径无效
        guard corners >= 2 else { return Path() }
        //确定要绘制图形的中心点（假设绘制的是矩形，就获取矩形中心）
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        //绘制方向是上方开始
        var currentAngle = -CGFloat.pi / 2
        //计算每个星星图形角需要移动多少距离
        let angleAdjustment = .pi * 2 / Double(corners * 2)
        //计算星星图形内部点需要移动多少X/Y
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness
        //创建路径
        var path = Path()
        //移动到初始位置
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))
        //创建一个绘制最低点，用来图形的居中计算
        var bottomEdge: Double = 0
        //循环遍历所有的点
        for corner in 0..<corners * 2 {
            //计算该点的位置
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double
            //当是2的倍数，绘制的就是星星的外边缘
            if corner.isMultiple(of: 2) {
                //存储Y点位置
                bottom = center.y * sinAngle
                //绘制点与点之间的线段
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                //如果不是2的倍数，那么就绘制内边
                bottom = innerX * sinAngle
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }
            //判断当前bottom是否是最地点的值，如果不是就更新
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            //移动到下一个点
            currentAngle += angleAdjustment
        }
        //计算画布（外面传递的frame）底部还有多少未使用的空间
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2
        //创建transform，将路径向下移动，使图形垂直居中
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct FFDrawPolygons: View {
    var body: some View {
        Spacer()
        Star(corners: 5, smoothness: 0.45)
            .fill(.red)
            .frame(width: 200, height: 200)
            .background(.green)
        Spacer()
        //由于星星是多边形，只需要将平滑度调整到1，就可以绘制八边形，代码没变化。
        Star(corners: 5, smoothness: 1)
            .fill(.red)
            .frame(width: 200, height: 200)
            .background(.green)
        Spacer()
    }
}

#Preview {
    FFDrawPolygons()
}
