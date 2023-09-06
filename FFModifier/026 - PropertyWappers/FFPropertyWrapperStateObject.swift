//
//  FFPropertyWrapperStateObject.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@StateObject
//SwiftUI的@StateObject属性包装器旨在填补状态管理中的一个非特定的空白：当你需要在视图内创建一个引用类型并确保它在该视图与其他与之共享的视图中保持active状态时。

import SwiftUI

//创建一个User类，并遵守obserVableObject
class StateObjectUser: ObservableObject {
    var username = "meta BBLv"
}

struct FFPropertyWrapperStateObject: View {
    //如果想在视图中使用它，可以在SwiftUI外部创建并注入，或者在SwiftUI中创建并使用@StateObject
    @StateObject var user = StateObjectUser()
    
    var body: some View {
        Text("Username: \(user.username)")
        //这将确保user实例视图更新时不会被销毁
        //以前，可以使用@ObservedObject来获得相同的结果，但这是不安全的操作。在极小的概率下@ObservedObject可能会意外释放它存储的对象，因为它并没有被设计成对象的最终数据源。说人话就是它不持有数据，不对数据负责。而@StateObject则不会出现此问题，所以引用类型要使用@StateObject修饰。
        //重要提示：在创建视图时负责对对象的创建，使用@StateObject创建的对象应该被创建一次，然后其他共享的视图使用@ObservedObject来共享对象。
    }
}

#Preview {
    FFPropertyWrapperStateObject()
}
