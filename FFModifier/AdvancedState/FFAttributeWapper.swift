//
//  FFAttributeWapper.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  @ObservedObject,@State和@EnvironmentObject之间的区别是什么？
//  在任何现代应用程序中，状态都是不可避免的，但对于SwiftUI，所有的视图都只是其状态的函数--不直接改变视图，而是操纵状态，让状态决定结果。
//  SwiftUI提供了几种在应用程序中存储状态的方法，但他们之间有微妙的不同。

import SwiftUI

struct FFAttributeWapper: View {
    //使用state最简单的方啊是使用@State属性包装器
    @State private var tapCount = 0
    var body: some View {
        //在视图中创建可一个属性，但是它使用@State属性包装器来请求SwiftUI管理内存。所有的视图都是结构体，这代表着他们不能被改变。
        //所以，当使用@State去创建一个属性时，把对它的控制交给SWiftUI，这样只要视图存在，它就会在内存中保持状态，当状态改变时，SwiftUI根据最新的变化重新加载视图，这样就可以更新视图了。
        //@State对于属性特定视图且永远不会再视图外使用的简单属性非常有用，因此将这些属性标记为私有以强化这样的想法：这种状态时专门设计的，永远不会逃离其视图。
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
        
        //什么是@ObservedObject?
        //对于更复杂的属性--当有一个想要使用的自定义类型，他可能有多个属性和方法，或者可能在多个视图之间共享--通常使用@ObservedObject。
        //这与@State非常相似，只是现在使用的是外部引用类型，而不是简单的本地属性（如字符串）。除了现在要负责管理自己的数据--需要创建累的实例，属性等等，视图会依赖于动态数据。
        //无论你使用@ObservedObject的类型是什么，都应该遵守ObserableObject协议。当向可观察对象添加属性时，可以决定对每个属性的更改是否应该强制监视对象的视图刷新，通常会这么做，但不是必须的。
        //观察对象有几种方法可以通知视图数据已经更改，但最简单的方法是使用@Published属性包装器，如果需要更多的控制，也可以使用Combine框架中的自定义发布者，但实际上这种情况非常少见。如果可观察对象碰巧有多个殊途在使用他的数据，任何改变都会通知所有视图。
        //**当使用自定义发布器宣布对象已更改时，必须在主线程。
        
        //什么是@StateObject？
        //@StateObject位于@State和@ObservedObject之间，这是ObservedObject的一个特殊版本，他的工作方式几乎完全相同：必须遵守ObservableObject协议，可以使用@Published将属性标记为引起更改通知，并且任何观察@StateObject的视图都会在对象更改时刷新其主体。
        //@StateObject和@ObservedObject之间有一个重要的区别，那就是所有权--那个视图创建了对象，那个视图在观察它。
        //规则是这样的：无论哪个视图是第一个创建对象的，都必须使用@StateObject，告诉SwiftUI它是数据的所有者，并负责保持数据存活。所有其他视图都必须使用@ObservedObject来告诉SwitUI他们想要观察对象的变化，但不直接拥有它。
        
        //什么是@EnvironmentObject？
        //已经了解@State如何为一个类型生面简单的属性，当它改变时自动刷新视图。以及@observedObject如果为一个外部类型声明属性，当他改变时可能会或不会导致视图刷新，这两个都必须有视图设置，但@ObsrevedObject可以与其他视图共享。
        //还有一种属性包装器，它是@EnvironmentObject，这是一个通过应用程序本身提供给视图的值--它是每个视图都可以读取的共享数据，如果引用有一些重要模型数据所有的视图都需要读取，可以把它从一个视图传递到另一个视图，或者把它放到每个视图都能及时访问的环境中。
        //当你需要在应用程序中传递大量数据是，把@Environment看作一个巨大的便利构造器，因为所有的视图都指向同一个模型，如果一个视图改变了模型，所有的视图都会立即更新，规避app不同部分不同步的风险。
        
        //总结差异：
        //对于属于单个视图的简单属性使用@State，通常将属性标记为private
        //对于可能属于多个视图的复杂属性，使用@ObservedObject，在使用引用类型时，大多数情况下应该使用@ObservedObject
        //对于使用的每个可观察对象，无论你的代码的那一部分负责创建它，都要使用一次@StateObject
        //对于在应用程序其他对方创建的属性，比如共享数据，使用@Environmentobject
        //在这四个对象中，@ObservedObject是最有用的也是最常用的。
    }
}

#Preview {
    FFAttributeWapper()
}
