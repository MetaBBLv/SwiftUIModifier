//
//  FFViewRotate3D.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何在3D中旋转视图。
//  SwiftUI的rotation3DEffect()修饰符让我们在3D空间中旋转视图，几乎不需要太多的代码就可以创造非常好的效果。它接受两个参数：要旋转的角度（以弧度或度为单位），以及包含要绕其旋转的X、Y和Z轴的元祖。


import SwiftUI

struct FFViewRotate3D: View {
    var body: some View {
        //将Text围绕X轴旋转45度
        Text("METABBLV SWIFTUI")
            .font(.largeTitle)
            .foregroundStyle(.green)
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z:0))
    }
}

#Preview {
    FFViewRotate3D()
}
