//
//  FFMetal.metal
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  要构建需要从视图冲采样颜色的着色器，将Metal文件导入头文件#include <SwiftUI/SwiftUI_Metal.h>，然后确保你的作色器签名接受位置和实例（SwiftUI::Layer）
#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>

using namespace metal;

//在该着色器中，SwiftUI需要前两个参数，它将自动传递视图的位置即当前颜色，第二个和其余参数都是我创建的，需要手动发送，这个着色器，我传递了类似棋盘的方块
[[ stitchable ]] half4 checkerboard(float2 position, half4 currentColor, float size, half4 newColor) {
    uint2 posInChecks = uint2(position.x / size, position.y / size);
    bool isColor = (posInChecks.x ^ posInChecks.y) & 1;
    return isColor ? newColor * currentColor.a : half4(0.0, 0.0, 0.0, 0.0);
}

//首先，你可以通过着色器放置在TimeLineView内并发送日期值来制作动画着色器。例如，可以创建一个开始日期并发送该开始日期和当前日期之间的差异来为shader提供动力
[[ stitchable ]] half4 noise(float2 position, half4 currentColor, float time) {
    float value = fract(sin(dot(position + time, float2(12.9898, 78.233))) * 43758.5453);
    return half4(value, value, value, 1) * currentColor.a;
}
