//
//  FFSimultaneousGesture.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何使用simultaneousGesture()同时识别两个手势
//  默认情况下，SwiftUI一次只会触发一个手势操作，通常时层次结构中最前面的视图。子视图优先于父视图，如果想覆盖此行为同时触发两个手势，则应在创建第二个以及后续手势时使用synchronousGesture()

import SwiftUI

struct FFSimultaneousGesture: View {
    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(width: 200,height: 200)
                .onTapGesture {
                    print("Circle Tapped!")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded({ _ in
                    print("VStack Tapped!")
                })
        )
        //你应该将synchronousGesture()与不会执行的手势一起使用，否则他将无法工作。因此，在示例中，使用带有源泉的simultaneousGesture()和带有VStack的简单onTapGesture，仍然会打印CircleTapped，他不会同时打印。
    }
}

#Preview {
    FFSimultaneousGesture()
}
