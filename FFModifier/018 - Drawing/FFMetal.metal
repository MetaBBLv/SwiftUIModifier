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

//像素化的着色器：将函数的输入限制为下限0.0001，以避免除以0，然后将每个像素的位置除以强度，四舍五入，然后再次相乘，导致像素数据被丢弃。真正的工作是调用layer.sample(),它从附加了该着色器的视图中读取一种颜色。
[[ stitchable ]] half4 pixellate(float2 position, SwiftUI::Layer layer, float strength) {
    float min_strength = max(strength, 0.0001);
    float coord_x = min_strength * round(position.x / min_strength);
    float coord_y = min_strength * round(position.y / min_strength);
    return layer.sample(float2(coord_x, coord_y));
}

//可以将一个像素从一个位置移动到赢一个位置，而保持其他位置不变。着意味着着色器只需要接受最小值的像素位置，因此可以创建波形实例
[[ stitchable ]] float2 simpleWave(float2 position, float time) {
    return position + float2 (sin(time + position.y / 20), sin(time + position.x / 20)) * 5;
}

//如果想要一个更像水下视图的复杂波浪着色器，那么就需要读取图像的整体大小。这需要更多的思考，因为需要将扭曲效果包装在视觉效果中以提供视图的size。首先，这是一个更复杂的波浪效果，需要视图的大小，但也有速度、强度和波浪频率的选项，以便更加可定制，
[[ stitchable ]] float2 complexWave(float2 position, float time, float2 size, float speed, float strength, float frequency) {
    float2 normalizedPosition = position / size;
    float moveAmount = time * speed;
    
    position.x += sin((normalizedPosition.x + moveAmount) * frequency) * strength;
    position.y += cos((normalizedPosition.y + moveAmount) * frequency) * strength;
    
    return  position;
}

//浮雕过滤器着色器
[[ stitchable ]] half4 emboss(float2 position, SwiftUI::Layer layer, float strength) {
    half4 current_color = layer.sample(position);
    half4 new_color = current_color;

    new_color += layer.sample(position + 1) * strength;
    new_color -= layer.sample(position - 1) * strength;

    return half4(new_color);
}
