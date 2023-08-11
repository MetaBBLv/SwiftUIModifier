//
//  FFViewType.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
// 如何返回不同类型的视图类型
//  借助名为 @ViewBuilder 的特殊属性，任何 SwiftUI 的 body 属性都会自动获得返回不同视图的能力。 这是使用 Swift 的结果生成器系统实现的，它了解如何根据我们应用程序的状态呈现两个不同的视图。然而，这种相同的功能并不是自动无处不在，这意味着您创建的任何自定义属性都必须返回相同的视图类型。

import SwiftUI

// 方案四：大多数情况下最有效的解决方案，是将视图分解为更小的视图，然后根据需求组合在一起
struct TossResult4: View {
    var body: some View {
        if Bool.random() {
            Image("chincoteague")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
}

struct FFViewType: View {
    
    //方案一：将输出包装在一个Group中，根据下面的例子，无论你发挥图像还是文本视图，它们都会返回到一个组中
    var tossResult: some View {
        Group {
            if Bool.random() {
                Image("chincoteague")
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Better luck next time")
                    .font(.title)
            }
        }
        .frame(width: 400,height: 150)
    }
    
    //方案二：使用类型擦除的包装器，返回AnyView
    var tossResult2: some View {
        if Bool.random() {
            return AnyView(Image("chincoteague")
                .resizable()
                .scaledToFit()
            )
        } else {
            return AnyView( Text("Better luck next time")
                .font(.title)
            )
        }
    }
    //方案三：使用@ViewBuilder，将它修饰到任何需要它的属性上
    @ViewBuilder var tossResult3: some View {
        if Bool.random() {
            Image("chincoteague")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
    
    var body: some View {
        List {
            Section {
                VStack {
                    Text("Coin Flip")
                        .font(.largeTitle)
                    tossResult
                }
            }
            
            //关于类型擦除，他会有效地迫使Swift忘记内部的具体类型，从而使他们看起来像是相同的东西，不过，这会带来性能成本，因此不要经常使用它。
            //用Group和AnyView都实现了相同的结果，两之间更推荐Group，对于SwiftUI来讲更加的高效
            Section {
                VStack {
                    Text("Coin Flip")
                        .font(.largeTitle)
                    tossResult2
                        .frame(width: 400, height: 150)
                }
            }
            
            Section {
                VStack {
                    Text("Coin Flip")
                        .font(.largeTitle)
                    tossResult3
                        .frame(width: 400, height: 150)
                }
            }
            
            Section {
                //这特别有助于分解逻辑和布局，并且还有一个好处是使你的视图在app的其他的地方可以重用。SwiftUI会自动折叠你的视图层次结构，因此当你分解视图时，不会产生有异议的性能差异。
                VStack {
                    Text("Coin Flip")
                        .font(.largeTitle)
                    TossResult4()
                        .frame(width: 400, height: 150)
                }
            }
        }
    }
}

#Preview {
    FFViewType()
}
