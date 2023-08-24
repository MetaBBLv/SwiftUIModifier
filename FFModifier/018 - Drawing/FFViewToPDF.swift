//
//  FFViewToPDF.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何将SwiftUI视图渲染成PDF
//  SwiftUI的ImageRenderer类可以将任何SwiftUI视图渲染为PDF。使用ImageRenderer创建PDF需要八个步骤：
//1. 决定要渲染那些视图
//2. 创建一个SwiftUI可以写入图像数据的URL
//3. 在图像渲染器上调用render()来启动渲染代码。
//4. 告诉SwiftUI你想要多大的PDF。可能是一个固定的大小，例如A4或US Letter，也可能是你正在呈现的视图大小。
//5. 创建一个CGContext对象来处理PDF页面
//6. 创建新的page
//7. 将SwiftUI视图呈现到该页面上
//8. 结束页面，并关闭PDF文档。

import SwiftUI

@MainActor
struct FFViewToPDF: View {
    var body: some View {
        Text("Hello, metaBBLv")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
        ShareLink("Export PDF", item: render())
        
    }
    
    func render() -> URL {
        //1. 渲染文本
        let renderer = ImageRenderer(content:
                                        Text("Hello, metaBBLv")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
        )
        //2. 保存到文档目录
        let url = URL.documentsDirectory.appending(path: "output.pdf")
        //3. 启动渲染进程
        renderer.render { size, context in
            //4. 告诉SwiftUI，我们的PDF应该和我们渲染的视图一样大
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            //5. 为PDF页面创建CGContext
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }
            //6. 创建一个新的PDF页面
            pdf.beginPDFPage(nil)
            //7. 将SwiftUI视图数据渲染到页面
            context(pdf)
            //8. 结束操作并关闭文件
            pdf.endPDFPage()
            pdf.closePDF()
        }
        return url
    }
}

@MainActor
#Preview {
    FFViewToPDF()
}
