# SwiftUIModifier
关于SwiftUI中基础组件的修饰符的学习过程，每一本View都是一组式样。
由于这是我的学习过程，所以并没有做过多的式样导航

## 案例详细
在掘金上对每一组案例实操，以及一些语言的描述，旨在熟能生巧，对SwiftUI的基础组件更熟悉的目的。这组资料是来自Paul Hudso的`Swift by Example`,有兴趣的同学可以研究一下，[地址：https://www.hackingwithswift.com/quick-start/swiftui/](https://www.hackingwithswift.com/quick-start/swiftui/)

#### [001 - SwiftUI基础篇Text](https://juejin.cn/post/7254472309283995707)

#### [002 - SwiftUI基础篇Image](https://juejin.cn/post/7255149657768230967)

#### [003 - SwiftUI基础篇ViewLayout](https://juejin.cn/post/7256975111563116601)

#### [004 - SwiftUI基础篇Stacks,Grids,ScrollViews](https://juejin.cn/post/7258149598031298615)

#### [005 - SwiftUI基础篇UI（上）](https://juejin.cn/post/7260016275299614777)

#### [006 - SwiftUI基础篇UI（下）](https://juejin.cn/post/7260149868781371453)

#### [007 - SwiftUI基础篇RespondingEvents](https://juejin.cn/post/7262640420470734909)

#### [008 - SwiftUI基础篇Tap Gestures](https://juejin.cn/post/7263125158948094012)

#### [009 - SwiftUI基础篇AdvancedState](https://juejin.cn/post/7263726955600887867)

#### [010 - SwiftUI基础篇List](https://juejin.cn/post/7265153693140713511)

#### [011 - SwiftUI基础篇Form](https://juejin.cn/post/7265673876033093695)

#### [012 - SwiftUI基础篇Container](https://juejin.cn/spost/7266455050632855571)

#### [013 - SwiftUI基础篇Navigation](https://juejin.cn/post/7267719499019862052)

#### [014 - SwiftUI基础篇Alert](https://juejin.cn/post/7268112661472198668)

#### [015 - SwiftUI基础篇Sheet](https://juejin.cn/spost/7268555713249083404)

#### [016 - SwiftUI基础篇Transforming(上)](https://juejin.cn/post/7269645636210229259)

#### [017 - SwiftUI基础篇Transforming(下)](https://juejin.cn/spost/7269949188984062006)

#### [018 - SwiftUI基础篇Drawing](https://juejin.cn/spost/7270799751091306535)

#### [019 - SwiftUI基础篇Animation（上）](https://juejin.cn/spost/7271070291690307638)

#### [020 - SwiftUI基础篇Animation（下）](https://juejin.cn/spost/7271270715860484108)

#### [021 - SwiftUI基础篇ComposingViews](https://juejin.cn/spost/7272181868073697292)

#### [022 - SwiftUI基础篇Cross-platform](https://juejin.cn/post/7272628880178528295)

#### [023 - SwiftUI基础篇CoreData](https://juejin.cn/post/7273025562142081060)

#### [024 - SwiftUI基础篇Accessibility](https://juejin.cn/post/7273384313958367244)

#### [025 - SwiftUI基础篇Instruments和Tools](https://juejin.cn/spost/7274856158174363702)

#### [026 - SwiftUI基础篇Property Wrappers](https://juejin.cn/post/7275150382253817919)

#### [027 - SwiftUI基础篇Property Wrappers - Items（上）](https://juejin.cn/post/7275551128854347787)

#### [028 - SwiftUI基础篇Property Wrappers - Items（下）](https://juejin.cn/post/7275641079382179879)

#### 基础篇部分已完结

## 如何运行更多的式样

#### 为SwiftUI小白准备
比如我想运行FFImageVideo这个view， 你ContentView()替换为FFImageVideo()就可以了。
```Swift
struct FFModifierApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            FFImageVideo()
        }
    }
}
```
