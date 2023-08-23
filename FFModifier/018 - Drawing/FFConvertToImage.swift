//
//  FFConvertToImage.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何将SwiftUI视图转换为图像
//  SwiftUI的ImageRenderer类能将任何SwiftUI视图渲染成图像，然后可以保存、共享或以其他方式重用。

import SwiftUI

struct RenderView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
//如果版本在iOS15以下，那么SwiftUI的视图没有内置功能将视图渲染成图像，只能自己创造一个。关键点为使用UIHostingContontroller来包装视图，然后将其视图层次结构渲染到UIGraphicsImageRenderer中。
//这最好使用View上的扩展来完成，这样你就可以正常调用他了。这应该将视图封装在托管控制器中，调整托管控制器视图的大小，使其成为SwitUI视图的内在内容大小，清楚任何背景色以保持渲染图像的干净，然后将视图渲染成图像并返回。
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct FFConvertToImage: View {
    @State private var text = "Your text here"
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    var textView: some View {
        Text("Hello, metaBBLv")
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
    
    var body: some View {
        
        VStack {
            renderedImage
            
            ShareLink("Export", item: renderedImage, preview: SharePreview(Text("Shared image"), image: renderedImage))
            TextField("Enter some text", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .onChange(of: text) { oldValue, newValue in
            //用某种方式进行图像的渲染，有四个关键注意点：
            //1. 如果你没有指定，你的图形将以1倍的比例渲染，在2倍和3倍的分辨率的屏幕上看起来模糊
            //2. 不能视图在主角色之外使用ImageRenderer，这可能意味着用@MainActor标记你的渲染代码。
            //3. 可以把想要渲染的SwiftUI视图放到ImageRenderer(conteng:)初始化器中，但几乎总是发现把他们分离到一个专门的视图中会产生更简洁的代码
            //4. 不像旧的UIGraphicsImageRenderer，没有简单的方法直接从ImageRenderer读取PNG或JPEG数据，所以你可以在代码中看到，需要读取UIImage的结果，然后调用她的pngData()方法。这是的代码对于跨平台用户来说更复杂。
            render()
        }
        //正如你所看到的，它在显示视图时调用render(),也在文本改变时调用render().
        Divider()
        //要在SwiftUI中使用这个场景，应该把视图创建作为一个属性，这样就可以在需要的时候引用它，比如，在按钮被点击时。
        //例如，将渲染一个文本视图编程一个图像，然后将其保存在用户的相册中。
        
        VStack {
            textView
            
            Button("Save to image") {
                let image = textView.snapshot()
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
        
    }
    
    @MainActor func render() {
        let renderer = ImageRenderer(content: RenderView(text: text))
        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    FFConvertToImage()
}
