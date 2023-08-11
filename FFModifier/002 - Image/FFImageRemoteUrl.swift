//
//  FFImageRemoteUrl.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
// SwiftUI的AsynImage用于从网上下载和显示远程图像的功能。只需要传递一个URL

import SwiftUI

struct FFImageRemoteUrl: View {
    var body: some View {
        
        List {
            //URL是可选参数，如果URL无效，将显示默认的灰色占位符。如果由于某种原因无法加载图像（用户离线、图像不存在），那么系统将继续显示相同的占位符图像
            //因为SwiftUI不知道下载的图像有多大，因此默认情况下AsyncImage载加载时具有灵活的宽度和高度。因此如果你不指定固定的宽度和高度，在图像加载之前会占用大量空间，然后在图像加载之后会调整到正确的大小。
            Section {
                AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"), scale: 4)
            }
            
            Section {
                AsyncImage(url: URL(string: "https://hws.dev/paul.jpg")) { image in
                    image.resizable()
                } placeholder: {
                    Color.green
                }
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            
            Section {
                AsyncImage(url: URL(string: "https://hws.dev/paul.jpg")) { phase in
                    switch phase {
                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                    case .success(let image): image .resizable()
                    default: ProgressView()
                    }
                }
                .frame(width: 256, height: 256)
                .clipShape(RoundedRectangle(cornerRadius: 25)) }
        }
        
    }
}

#Preview {
    FFImageRemoteUrl()
}
