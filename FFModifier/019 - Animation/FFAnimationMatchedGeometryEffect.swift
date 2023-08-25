//
//  FFAnimationMatchedGeometryEffect.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  使用matchedGeometryEffect()将动画从一个视图同步到另一个视图。
//  如果相同的视图出现在视图层次结构中的两个不同部分，并且想要在他们之间进行动画。那么从列表视图切换到缩放的细节，就要使用matchedGeometryEffect()修饰符。类似Keynote中的majic move。
//  若要使用修饰符，将其附加到层次结构中的不同部分的一对相同的视图上。两个视图状态之间切换时，会发现SwiftUI平滑的激活了同步视图。

import SwiftUI

struct FFAnimationMatchedGeometryEffect: View {
    @State private var isFlipped = false
    
    @Namespace private var animation
    @State private var isFlipped1 = false
    
    @Namespace private var appleMusic
    @State private var isZoomed = false
    
    var frame: Double {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        //一个视图状态中有一个红色圆和文本，另外一个视图状态中，圆在文本之后并改变颜色
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width:44, height: 44)
                Text("metaBBLv - Keep loving")
                    .font(.headline)
            } else {
                Text("metaBBLv - Keep loving")
                    .font(.headline)
                Circle()
                    .fill(.blue)
                    .frame(width: 44, height: 44)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
        //其实实现的动画效果就是文字在点击之后移动到图的下方，但是显然这种方式很愚蠢。
        //有更好的方式，首先，需要使用@Namespace属性包装器为视图创建一个全局命名空间。在实践中，这只不过是视图上的一个属性，但在原理上，可以将视图链接在一起。
        //所以，添加一个animation属性：@Namespace private var animation.
        //接下来，添加matchedGeometryEffect动画效果。
        
        VStack {
            if isFlipped1 {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                Text("metaBBLv - Keep loving")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
            } else {
                Text("metaBBLv - Keep loving")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped1.toggle()
            }
        }
        //在实现一个更高级的例子，关于Apple Music的专辑显示风格，点击时可以将小视图扩展到更大的视图。
        VStack {
//            Spacer()
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if isZoomed == false {
                        Text("metaBBLv - Keep loving")
                            .matchedGeometryEffect(id: "AlbumTitle", in: appleMusic)
                            .font(.headline)
                        Spacer()
                    }
                }
                
                if isZoomed == true {
                    Text("metaBBLv - Keep loving")
                        .matchedGeometryEffect(id: "AlbumTitle", in: appleMusic)
                        .font(.headline)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation {
                    isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(Color(white: 0.9))
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    FFAnimationMatchedGeometryEffect()
}
