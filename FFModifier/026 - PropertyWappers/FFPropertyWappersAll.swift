//
//  FFPropertyWappersAll.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/5.
//
//  所有SwiftUI的属性包装器的解释和比较
//SwiftUI提供了17个属性包装器，每个属性包装器都提供了不同的功能，正确的使用属性包装器太重要了。
//简要描述属性包装器的作用，是否拥有其数据（管理数据的能力）：
//- @AppStorage从UserDefaults读取和写入值。拥有数据
//- @Binding指的是不同视图拥有的值类型数据。更改本地绑定也会更改远程数据，不拥有数据。
//- @Environment可以在系统读取数据，例如配色方案、可访问性选项和特征集合，但如果需要，可以在此处添加自己的键，不拥有数据。
//- @EnvironmentObject读取放入环境中的共享对象，不拥有数据
//- @FetchRequest启动特定实体的核心数据获取请求，拥有数据
//- @FocusedBinding旨在监视关键窗口的值，例如当前选定的文本字段，不拥有数据。
//- @FocusedValue是一个简易版本的@FocusedBinding，不解开绑定值，不拥有数据
//- @GestureState存储与当前正在进行的手势关联的值，例如滑动距离，当手势停止时重制为默认值，拥有数据。
//- @Namespace创建一个动画命名空间以允许匹配集合效果，该效果可以由其他视图共享。拥有数据
//- @NSApplicationDelegateAdaptor用于创建一个类并将其注册为macOS应用程序Delegate，拥有数据
//- @ObservedObject指的是符合协议的外部类的实例ObservedObject，不拥有数据
//- @Published附加到ObservableObject内的属性，并告诉SiftUI在数据更改时刷新使用此属性的任何视图，拥有数据。
//- @ScaledMetric读取用户的动态类型设置并根据提供的原始值当大或缩小数字。拥有数据
//- @SceneStorage可以保存和恢复少量数据以进行状态的恢复（比如前后台切换），拥有数据
//- @State在本地视图操作少量的值类型数据，拥有数据
//- @StateObject用于存储符合ObservableObject协议的引用类型数据的新实例。拥有数据
//- @UIApplicationDelegateAdaptor用于创建一个类并将其注册为iOS应用程序的AppDelegate，拥有数据

//存储临时数据
//当涉及到在程序中存储数据时，最简单的属性包装器是@State，它旨在存储视图在本地使用的值类型，因此非常适合存储Int、Bool和Struct的实例
//相比之下，@Binding用于希望更改但不由视图拥有的简单数据。例如，Toggle工作原理：它需要在打开和关闭状态之间切换，但不希望自己存储该值，因此会绑定到视图拥有的某个外部值。所以，视图具有@State属性，而Toogle具有@Binding属性。
//还有一种称为@GestureState的@State的变化，专门用于跟踪Active手势。使用频率不高，但是此属性包装器的优势在于在手势结束时将属性重置为其初始值。
//对于更高级的用途，即处理类在许多地方共享数据，不应使用@State和@Binding。相反，应该在某处使用@StateObject创建对象，然后在其他视图使用@ObservedObject 声明属性。
//一个简单的规则是：如果在属性包装器的名称中只要包含“state”，也就是@*State，就明确了当前视图拥有数据。
//因此，@State表示简单的值类型在本地的创建与管理，但可能使用@Binding在其他地方共享，而@StateObject表示引用类型数据在本地创建和管理，可以在其他的地方使用@ObservedObject进行数据共享。
//这非常重要：如果看到@ObservedObject var something = SomeType()，虽然在编译期不会报错，但是存在较大的隐患，在此处使用@ObservedObject声明并给变量初始化，可能会由于对象被提前销毁从而导致应用程序的崩溃。看到这样的声明，肯定要更改为@StateObject来修饰，这样SwiftUI就知道视图拥有此数据，而不是引用它。
//如果要将相同的数据从一个视图传递到另一个视图，那么使用@EnvironmentObject将非常有用，因为它可以从共享环境中读取引用类型对象，而不是明确要传递它。
//就像ObservableObject一样，@EnvironmentObject不应该用于初始对象的创建。相反，应该在不同的视图中使用它，并使用environmentObject()修饰符将其注入到环境中。虽然环境会自动保持你的对象的所有权，但你也可以使用@StateObject将其存储在最初创建的地方。但这并不是必须的步骤。将对象放入到环境中足以使其在不进一步获得所有权的情况下保持活跃状态。
//最后一个基于状态的属性包装器是@Published，它用于在你的引用类型内标记属性。任何使用@Published标记的属性都会在值改变时导致其所有引用的视图发生刷新。

//存储持久化数据
//在SwiftUI中，有三个属性包装器用于存储或检索数据
//- @AppStorage，它是UserDefaults的封装器，每次从应用存储中读取或写入值，实际上在读取和写入UserDefaults。
//- @SceneStorage，它是围绕Apple的状态恢复API的封装器。状态恢复时应用程序关闭并重新加载，并回到用户离开时的相同状态的机制。这使得应用看起来像在一直运行，其实在后台已经被默默关闭了。
//@AppStorage和@SceneStorage不安全，不可以用于存储敏感数据。
//尽管@AppStorage和@SceneStorage看起来相似，但他们并不相同：@AppStorage为整个应用程序存储一个值，而@SceneStorage会自动为统一数据的多个值保存多次，以应对用户多次打开应用程序窗口的情况（iPadOS与macOS场景）
//因此，使用AppStorage来存储全局值（不是那么重要的数据），比如“用户现在心情怎么样”，而使用@SceneStorage用来存储“用户当前正在浏览哪个页面”
//- @FetchRequest，用于从CoreData中检索信息，将自动使用环境中任何托管对象的context，并在底层数据发生更改时更新自身。

//读取环境数据
//SwiftUI提供了两个属性包装器用于读取用户的环境数据：@Environment和@ScaledMetric
//- @Environment用于读取各种数据，例如当前active的特征集合是什么，用户时候使用了2x或3x的屏幕，所在时区是什么等。他还具有一些特殊的应用程序操作，例如导出文件和在系统注册的网络浏览器中打开URL。前提是你需要知道你要使用的系统环境变量的selector。
//- @ScaledMetric使用要更加简单，它根据用户的动态类型设置来调整用户界面的大小。例如，一个大小为100*100的框在使用系统默认大小时看起来很好，但使用@ScaledMetric后，当启用较大的动态类型设置时，自动编程200*200。

//NameSpace
//SwiftUI提供了@Namespace属性包装器，它可以为动画创建一个新的命名空间。比如对id为5的视图进行动画处理。可以通过使用属性类型Namespace.ID并从创建它的视图注入@Namespace值在视图之间共享命名空间。这可以在视图之间创建匹配的集合教过动画，而不必在当前视图中存储所有数据。

//Application Delegate
//如果想在SwiftUI中访问旧的UIApplicationDelegate和NSApplicationDelegate方法及通知，可以分别使用@UIApplicationDelegateAdaptor和@NSApplicationDelegateAdapotr属性包装器创建对应的类。
//并且还需要提供这些包装器的参数是AppDelegate的类，他们会确保创建一个实例并将适当的通知发送给他。

//数据源的管理
//之前我描述了那些属性包装器拥有它的数据源，实际上这涉及到你的应用程序中的数据源：拥有他们的数据的包装器是数据源，因为他们创建和管理值，而不拥有他们的数据的包装器不是数据源，因为他们从其他地方获得数据。
//拥有数据的属性包装器（直接创建和管理值）：
//- @AppStorage
//- @FetchRequest
//- @GestureState
//- @Namespace
//- @Published
//- @ScaledMetric
//- @SceneStorage
//- @State
//- @StateObject
//- @NSApplicationDelegateAdaptor
//- @UIApplicationDelegateAdaptor
//未拥有数据源的属性包装器（在其他地方获取值）：
//- @Binding
//- @Environment
//- @EnvironmentObject
//- @FocusedBinding
//- @FocusedValue
//- @ObservedObject

//总结
//对于这么多的属性包装器可能看起来有点烦，所以只要记住一下两点就可以很舒服搞SwiftUI了
//- 如果想创建一个由当前视图拥有的心属性，值类型使用@State修饰，引用类型使用@StateObject修饰。
//- 如果想引用在其他地方创建的值，值类型使用@Binding，应用类型使用@ObservedObject或@EnvironmentObject

import SwiftUI

struct FFPropertyWappersAll: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWappersAll()
}
