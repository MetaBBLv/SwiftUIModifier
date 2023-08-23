//
//  FFDrawCheckerboard.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  绘制一个棋盘
//  SwiftUI的路径不需要时连续的、孤立的形状，而是可以为多个矩形、椭圆或更多的形状，所有这些都可以组成一个。
//

import SwiftUI

struct CheckerBorad: Shape {
    let rows: Int
    let columns: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //计算出行和列的空间大小
        let rowSize = rect.height / Double(rows)
        let columnsSize = rect.height / Double(columns)
        //循环遍历所有行和列，使方块交替着色。
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    //满足条件绘制方块
                    let startX = columnsSize * Double(column)
                    let startY = columnsSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnsSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct FFDrawCheckerboard: View {
    var body: some View {
        CheckerBorad(rows: 10, columns: 10)
            .fill(.gray)
            .frame(width: 300, height: 300)
    }
}

#Preview {
    FFDrawCheckerboard()
}
