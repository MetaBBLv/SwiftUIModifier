//
//  FFPropertyWrapperEnvironment.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@Environment
//SwiftUI提供了@Environment和@EnvironmentObject两个属性包装器，但他们在细节上有一些不同：而@Environmentobject可以将值注入到环境中，@Environment特别用于与SwiftUI自己预定义的key一起使用。


import SwiftUI



struct FFPropertyWrapperEnvironment: View {
    //例如，@Environment很适合读取CoreData托管对象的context、设备是否处于深色模式或浅色模式、渲染视图时使用的大些类别等固定属性，这些属性来自系统
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.managedObjectContext) var managedObjectContext
    //@Environment作用是在环境中读取对象
    @EnvironmentObject var order: EnvironmentOrder
    //这个区别看起来很小，但由于@EnvironmentObject的实现方式，它非常重要。当我们说order的类型是EnvironmentOrder时，SwiftUI将查找其环境以找到该类型的对象并将其附加到order属性上。然而，使用@Environment时，同样的行为不太可能发生，因为许多东西可能共享相同的数据类型。
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    //这三个环境key都返回一个bool值，所以如果不明确指定是那个Key，就无法正确读取他们。
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWrapperEnvironment()
}
