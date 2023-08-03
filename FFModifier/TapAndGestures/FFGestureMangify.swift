//
//  FFGestureMangify.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/3.
//
//  如何处理缩放视图的捏合
//  SwiftUI的MangifyGesture用于跟踪视图的缩放，可以绑定到scalEffect()修饰符，因此用户的捏合手势会自动缩放或虽小视图
//  如果你想在他们完成手势后保持他们的缩放比例，你应该跟踪他们的当前和总缩放的级别。

import SwiftUI

struct FFGestureMangify: View {
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    @GestureState private var zoom = 1.0
    
    var body: some View {
        Image(.chrysanthemumTea)
            .scaleEffect(currentZoom + totalZoom)
            .gesture(
                MagnifyGesture()
                    .onChanged({ value in
                        currentZoom = value.magnification - 1
                    })
                    .onEnded({ value in
                        totalZoom += currentZoom
                        currentZoom = 0
                    })
            )
            .accessibilityZoomAction { action in
                if action.direction == .zoomIn {
                    totalZoom += 1
                } else {
                    totalZoom -= 1
                }
            }
        //从Value.magnification中减去1很重要，因为1是新手势的默认值，使用accessibilityZoomAction()修饰符可以辅助技术控制缩放级别。
        //另一方面，如果你想跟踪他们的手势，但每次都重置为0，使用@GestureState
        Image(.fullEnglishThumb)
            .scaleEffect(zoom)
            .gesture(
                MagnifyGesture()
                    .updating($zoom, body: { value, gestureState, transaction in
                        gestureState = value.magnification
                    })
                )
        
    }
}

#Preview {
    FFGestureMangify()
}
