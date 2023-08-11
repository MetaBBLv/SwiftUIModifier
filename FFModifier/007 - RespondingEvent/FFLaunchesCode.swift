//
//  FFLaunchesCode.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何在应用程序启动的时候运行代码
//  当你使用SwiftUI应用程序生命周期时，你的应用程序将通过应用程序协议的结构体启动。它是使用WindowGroup、DocumentGroup类似的工具创建初始视图，但因为它在你任何的实际视图之前创建的，所以这是在应用程序启动时运行代码的完美位置。
//  例如：如果你想设置一些初始UserDefaults值，那么应用程序的初始值谁能够项是调用register(defaults:)的好地方。此方法设置默认值，我的意思是UserDefaults值的初始值仅在你设置它们之前存在，一旦你提供了自己的值，这些值不再使用，并且这些初始值也会在一下情况下消失：app终止。
import SwiftUI

//initializer()在body属性之前被调用，所以它在ContentView之前被调用，因此，你在ContentView中读取UserDefaults的任何地方都已经有了你的默认值。为了演示这一点，这里有一个示例ContentView结构体，它使用@AppStorage读取name的值。
struct FFLaunchesCode: View {
    //一种属性包装器类型，它反映UserDefaults中的值，并在该用户默认值的值更改时使视图无效。
    @AppStorage("name") var name = "Anonymous"
    var body: some View {
        //当通过@AppStorage属性包装器生命的变量，只有当没register默认值的时候才用。如果有默认值，就使用默认的。
        Text("Your name is \(name).")
    }
}

#Preview {
    FFLaunchesCode()
}
