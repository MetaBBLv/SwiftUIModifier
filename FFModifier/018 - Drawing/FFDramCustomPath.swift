//
//  FFDramCustomPath.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何绘制自定义路径
//  SwiftUI可以根据Shape协议绘制自定义路径，这样就可以创建自定义形状，可以是矩形、胶囊图形、圆形等。遵守这个协议并不难，因为需要做的就是支持一个接受CGRect并返回path的path(in:)方法。更棒的事，可以使用之前用CGPath或UIBezierPath构建的任何路径，然后将结果转换为SwiftUI路径。
//如果想使用SwiftUI的原生路径类型，创建他的一个实例变量，然后根据需要添加尽可能多的点或形状。不需要考虑颜色、填充或边框宽度。这里只关注原始类型，这些设置是在使用自定义path时设定的。

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in stride(from: 1, to: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            path.addRect(insetRect)
        }
        return path
    }
}

struct FFDramCustomPath: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    FFDramCustomPath()
}
