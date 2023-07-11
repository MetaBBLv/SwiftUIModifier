//
//  FFImagetile.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// 如果SwiftUI被要求使用图像视图占用的空间超过图像设计的空间，它的默认行为是拉伸图像，使其适合你所要求的空间。然而，它不需要这样，它可以平铺图像（水平或垂直重复），以便填满空间。关键将resizable()修饰符与其resizingMode参数一起使用，可以是.stretch(默认)、tile

import SwiftUI

struct FFImagetile: View {
    var body: some View {
        VStack {
            Image(.allOutDonuts)
                .resizable(resizingMode: .tile)
            
            // 如果你只想平铺图像的一部分（或将一个或多个边缘固定到图像视图的边缘），那么可以为第一个参数提供边缘插入
            
            Image(.cheeseToastie)
                .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
            
            
        }
    }
}

#Preview {
    FFImagetile()
}
