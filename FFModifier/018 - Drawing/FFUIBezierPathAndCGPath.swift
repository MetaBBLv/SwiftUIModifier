//
//  FFUIBezierPathAndCGPath.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何在SwiftUI中使用UIBezierPath和CGPath
//  如果你有使用UIBeizerPath或CGPath的现有路径，转换他们在SwiftUI中使用微不足道的，因为Path结构体有一个直接来自CGPath的初始化器。
//  注意：UIBezierPath在macOS中不可用，如果想让SwiftUI代码跨平台，应该迁移到CGPath。

import SwiftUI

extension UIBezierPath {
    //Unwrap标识为贝塞尔路径
    static var logo: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.534, y: 0.5816))
        path.addCurve(to: CGPoint(x: 0.1877, y: 0.088), controlPoint1: CGPoint(x: 0.534, y: 0.5816), controlPoint2: CGPoint(x: 0.2529, y: 0.4205))
        path.addCurve(to: CGPoint(x: 0.9728, y: 0.8259), controlPoint1: CGPoint(x: 0.4922, y: 0.4949), controlPoint2: CGPoint(x: 1.0968, y: 0.4148))
        path.addCurve(to: CGPoint(x: 0.0397, y: 0.5431), controlPoint1: CGPoint(x: 0.7118, y: 0.5248), controlPoint2: CGPoint(x: 0.3329, y: 0.7442))
        path.addCurve(to: CGPoint(x: 0.6211, y: 0.0279), controlPoint1: CGPoint(x: 0.508, y: 1.1956), controlPoint2: CGPoint(x: 1.3042, y: 0.5345))
        path.addCurve(to: CGPoint(x: 0.6904, y: 0.3615), controlPoint1: CGPoint(x: 0.7282, y: 0.2481), controlPoint2: CGPoint(x: 0.6904, y: 0.3615))
        return path
    }
}
//它使用的控制点被归化为0-1的范围，这样就可以在任何类型的容器中渲染它并将其缩放以适应可用空间。
//在SwiftUI中，着意味着创建一个transform，将贝塞尔路径锁防盗最小的宽度或高度，然后将其应用到路径上。
struct ScaledBezier: Shape {
    let bezierPath: UIBezierPath
    
    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)
        //计算出我们需要多大的路径来填充可用空间而不进行剪切
        let multiplier = min(rect.width, rect.height)
        //创建一个仿射transform，对两个维度使用相同的乘数
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        //应用该比例返回结果
        return path.applying(transform)
    }
}

struct FFUIBezierPathAndCGPath: View {
    var body: some View {
        ScaledBezier(bezierPath: .logo)
            .stroke(lineWidth: 2)
            .frame(width: 200, height: 200)
    }
    //如果你从CGPath而不是UIBezierPath开始，操作就更加的简单，可以直接使用 let path = path(...)来直接绘制路径
}

#Preview {
    FFUIBezierPathAndCGPath()
}
