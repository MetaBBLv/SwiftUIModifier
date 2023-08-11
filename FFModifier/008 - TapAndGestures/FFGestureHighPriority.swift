//
//  FFGestureHighPriority.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何使用highPriorityGesture()强制一个手势优先于另外一个手势
//  如果一个SwiftUI视图位于另一个视图中，并且两者具有相同的手势识别，则系统将始终在父级之前触发子集的手势。可以使用highPriorityGesture()来更改此行为，强制系统有限考虑你指定的手势。
import SwiftUI

struct FFGestureHighPriority: View {
    var body: some View {
        List {
            //始终触发圆形的手势
            VStack {
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        print("Circle Tapped!")
                    }
            }
            onTapGesture {
                print("VStack Tapped!")
            }
            //如果想触发VStack的手势，则需要使用highPriorityGesture()
            VStack {
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        print("Circle Tapped!")
                    }
            }
            .highPriorityGesture(
                TapGesture()
                    .onEnded({ _ in
                        print("VStack Taped!")
                    })
            )
            //使用这个修饰符，将始终打印“VStack tapped”，因为VStack手势始终优先于圆圈的手势。
        }
    }
}

#Preview {
    FFGestureHighPriority()
}
