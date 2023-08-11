//
//  FFCanvasDropDraggable.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/2.
//

import SwiftUI

struct FFCanvasDropDraggable: View {
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")
    
    var body: some View {
        //当你想项视图添加拖动功能时，使用draggable()任何内容添加修饰符。Transferable在默认情况下，SwiftUI将使用视图本身进行拖动预览，如果你从应用程序内拖动图像，你会发现可以使用放置类型，而不必想将Image.self转换为Data再转为UIImage
        //例如，显示3个不同的SF Symbol，并可以将其拖动到下面的框中
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundStyle(.white)
                        .draggable(Image(systemName: sport))
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)
            
            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundStyle(.white)
                .dropDestination(for:Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photot")
                    return true
                }
        }
        
        //重要提示：当你拖动SF Symbol图像时，SwiftUI将发送图像像素数据，而不是可整体缩放的矢量。这意味着删除的数据不会响应font()或foregroundStyle()等修饰符
        //如果你想显示自定义拖动预览，添加一些带有SwiftUI视图的尾随闭包。例如，这会生成一个可拖动的golf图像，并在其旁边添加文本“Figure Playing Golf”
        Image(systemName: "figure.golf")
            .frame(minWidth: 50, minHeight: 50)
            .background(.red)
            .foregroundStyle(.white)
            .draggable(Image(systemName: "figure.golf")) {
                Label("Figure playing golf", systemImage: "figure.golf")
            }
    }
}

#Preview {
    FFCanvasDropDraggable()
}
