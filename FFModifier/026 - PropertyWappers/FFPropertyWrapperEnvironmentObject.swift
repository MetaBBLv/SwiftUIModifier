//
//  FFPropertyWrapperEnvironmentObject.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@EnvironmentObject
//SwiftUI的@EnvironmentObject属性包装器可以创建依赖于共享数据的视图，通常跨足整个SwiftUI应用程序。例如，如果创建一个将在应用程序的许多部分之间共享的用户对象，那么使用@EnvironmentObject

import SwiftUI

//它符合ObserveableObject协议，这代表了可以使用@Observedobject或@EnvironmentObject来修饰对象。
class EnvironmentOrder: ObservableObject {
    @Published var items = [String]()
}

struct FFPropertyWrapperEnvironmentObject: View {
    //通过@EnvironmentObject来修饰对象，这是一个共享数据，也就是本身并不持有数据。
    @EnvironmentObject var order: Order
    //order属性并没有通过@EnvironmentObject初始化，并给出默认值。在当前这个视图中，该值由SwiftUI环境提供，而不是由此视图显示创建。
    //@EnvironmentObject和@ObservedObject有很多相似之处
    //- 两者都必须引用遵守OvservableObject协议的class
    //- 两者可以夸多个视图共享数据
    //- 在使用@Published属性包装器修饰的属性发生更改时，都会更新任何引用此数据的视图。
    //- 使用@EnvironmentObject的对象将由外部实体提供，而不是由当前视图创建。
    
    //实际应用场景：将视图A的数据传递到视图E，中间间隔了视图（B、C和D）如果使用@ObservedObject需要链式传递，不管中间视图（B、C和D）是否需要数据，都也被动接收， 传递链条：A->B->C->D->E
    //当使用@EnvironmentObject时，视图A创建一个对象并将其放入环境中，然后，内部的任何视图都可以在需要时随时访问该环境对象，只需要对环境请求即可，不需要显示传递，传递链条：A（创建并放入Environment）-> E (直接在Environment中读取)
    //异常点：当显示使用@EnvironmentObject的视图时，SwiftUI将立即在环境中搜索正确类型的对象。如果找不到（比如忘记放入到Environment中），那么应用程序将立即crash。也就代表着，当你使用@EnvironmentObject时，你实际上是在告诉SwiftUI，我已经将对象存在环境中了，类似使用隐式解包。
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FFPropertyWrapperEnvironmentObject()
}
