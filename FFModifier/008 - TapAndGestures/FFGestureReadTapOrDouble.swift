//
//  FFGestureReadTapOrDouble.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何读取单击和双击手势
//  任何SwiftUI视图都可以附加Tap操作，并且可以指定在触发操作之前应接受多少次点击
import SwiftUI

struct FFGestureReadTapOrDouble: View {
    var body: some View {
        List {
            //单击
            Text("Tap me!")
                .onTapGesture {
                    print("Tapped!")
                }
            //双击
            Image(.filletSteak)
                .onTapGesture(count: 2, perform: {
                    print("Double Tapped!")
                })
        }
    }
}

#Preview {
    FFGestureReadTapOrDouble()
}
