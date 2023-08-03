//
//  FFGestureShake.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何检测摇动手势
//  SwiftUI没有内置的方法来检测用户摇动设备，但通过重写UIWindow中的motionEnded()并创建自定义视图修饰符。
/**5个步骤：
 1、想UIDevece添加扩展以跟踪发生摇动手势时将发送新的通知。
 2、在UIWindow上创建扩展以覆盖默认的motionEnded()方法，这是UIKit发送摇动手势的地方，因此你应该查找发生的情况并将其转换为新通知。
 3、创建一个自定义视图修饰符来监视发布的摇动通知，并在发生时调用你选择的函数。
 4、创建一个视图扩展来整齐的包装你的新修饰符。
 5、在视图中使用一下
 */
//重要提示，在编写文本时，视图修饰符不能与onReceive（）一起使用，除非你先添加onAppear()，空函数实现就可以，可以解决问题.

import SwiftUI

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification), perform: { _ in
                action()
            })
    }
}


extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}


struct FFGestureShake: View {
    var body: some View {
        Text("Shake me!")
            .onShake {
                print("Device shaken!")
            }
    }
    //完成了上面自定义shake步骤，就可以继续向你想要的任何视图添加onShake修饰符，提供一些在摇动手势发生时运行的自定义代码。
}

#Preview {
    FFGestureShake()
}
