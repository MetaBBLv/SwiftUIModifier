//
//  FFCanvasDropImage.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/2.
//

import SwiftUI

struct FFCanvasDropImage: View {
    @State private var message = ""
    @State private var image = Image(systemName: "photo")
    var body: some View {
        //处理图像有点困难，因为我们将获得一个代表图像内容的data实例。我们需要将其转化为UIImage，并将结果放入图像中进行渲染。幸运的是，如果我们支持data，那么两只都会起作用，所以想这样的代码允许用户将图像从照片中直接拖入到我们的应用程序中
        image
            .resizable()
            .scaledToFit()
            .frame(width: 300,height: 300)
            .dropDestination(for: Data.self) { items, location in
                guard let item = items.first else { return false }
                guard let uiImage = UIImage(data: item) else { return false }
                image = Image(uiImage: uiImage)
                return true
            }
    }
}

#Preview {
    FFCanvasDropImage()
}
