//
//  FFCanvasDrop.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/31.
//
//  如何在SwiftUI中支持拖放
//  SwiftUI的Transferable协议可以使用dropDestination()和draggable()修饰符，无需大量代码即可为App添加拖放功能


import SwiftUI

struct FFCanvasDrop: View {
    @State private var message = ""
    @State private var image = Image(systemName: "photo")
    @State private var images = [Image]()
    
    var body: some View {
        /**关键部分是dropDestination()修饰符，做4件事：
         1.接受的类型（String）
         2.预计会截取到在应用程序上掉落的项目数组。自动转化为String数组。
         3.我们被告知他们被扔在哪里，这将是画布坐标空间中的CGPoint
         4.我们认为掉落操作是成功的，所以返回true
         */
        Canvas { context, size in
            let formattedText = Text(message)
                .font(.largeTitle)
                .foregroundStyle(.red)
            context
                .draw(formattedText, in: CGRect(origin: .zero, size: size))
        }
        .dropDestination(for: String.self) { items, location in
            message = items.first ?? ""
            return true
        }
    }
}

#Preview {
    FFCanvasDrop()
}
