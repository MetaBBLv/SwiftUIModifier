# SwiftUIModifier
关于SwiftUI中基础组件的修饰符的学习过程，每一本View都是一组式样。
由于这是我的学习过程，所以并没有做过多的式样导航

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
