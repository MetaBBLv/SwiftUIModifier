//
//  FFImagefitToSpace.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI的Image视图能够以不同的方式缩放，就像UIImageView一样，默认情况下，图像视图会自动根据器内容调整大小，这可能会是他们超出屏幕范围，如果添加了resizable()修饰符，则图像将自动调整大小，以便填充到可用空间，无论是在你指定的框架中还是屏幕上的任何空间中

import SwiftUI

struct FFImagefitToSpace: View {
    var body: some View {
        Image(.allOutDonutsThumb)
            .resizable()
            .frame(width: 200)
        
        //然而，这会导致图像的原始纵横比扭曲，因为它将在所有维度上拉伸以填充空间，如果你想保持纵横比，可以使用aspecRatio的.fill火.fit修饰符
        Image(.allOutDonutsThumb)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
    }
}

#Preview {
    FFImagefitToSpace()
}
