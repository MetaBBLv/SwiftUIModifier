//
//  FFGestureOnTap.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/3.
//
//  如何检测视图中的tap insert位置
//  SwiftUI中有一个onTapGesture()变量，可以检测点击的确切位置，无论是相对于视图的边界还是在整个屏幕的全局位置。


import SwiftUI

struct FFGestureOnTap: View {
    var body: some View {
        //例如，显示一个红色的圆圈，打印他收到的任何点击的相对位置。
        Circle()
            .fill(.green)
            .frame(width: 100, height: 100)
            .onTapGesture { location in
                print("Tapped at \(location)")
            }
        //相对位置是指相对一圆圈的边界--由于圆圈的大小为100*100，如果你点击的中心，无论圆圈防止在屏幕上的任何位置，都会打印50
        //如果你想要全局位置--即相对于屏幕左上角的位置，你应该这样添加参数，coordinateSpace
        Circle()
            .fill(.blue)
            .frame(width: 100,height: 100)
            .onTapGesture(coordinateSpace: .global) { location in
                print("Tapped at \(location)")
            }
        //此onTapGesture在iOS16以及更高版本可用，如果你想在早起版本上做类似的事情。可以通过包装UIKit实现。
    }
}

#Preview {
    FFGestureOnTap()
}
