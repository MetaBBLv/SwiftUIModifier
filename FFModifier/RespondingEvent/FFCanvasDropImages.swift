//
//  FFCanvasDropImages.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/2.
//

import SwiftUI

struct FFCanvasDropImages: View {
    @State private var images = [Image]()
    
    var body: some View {
        //将多个图像拖入数组中，遵循相同的过程：使用dropDestination(for:Data.Self)，但现在不应该只读取一个项目，而是应该读取全部。
        //例如：ScrollView通过每个Data实例转化为UIImage，然后转换为SwiftUI，在ScrollView中显示多张Image
        ScrollView {
            VStack {
                ForEach(0..<images.count, id: \.self) { i in
                    images[i]
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .dropDestination(for: Data.self) { items, location in
                images = items.compactMap({
                    UIImage(data: $0).map(Image.init)
                })
                
                return true
            }
        }
    }
}

#Preview {
    FFCanvasDropImages()
}
