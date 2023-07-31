//
//  FFDeviceRotation.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
// 如何更改设备的rotation
//  SwiftUI没有内置的方法来检测用户在纵向和横向之间旋转设备，但我们可以通过响应UIDevice使用自定义修改器来创建一个UIDevice.orientationDidChangeNotification通知。
/**三个步骤：
 1、创建一个自定义视图修饰器，用于监视方向变化，并在发生变化时运行毁掉函数。这不是必须的，但我们会让回调接受一个UIDeviceOrientation作为他的唯一的参数，以防你需要知道当前的朝向。
 2、将视图修饰符包装在视图扩展中，以便更容易调用
 3、在选择的视图中使用自定义修饰符
 **/
//重要：在编写视图修饰符时，除非你先添加onAppear()，否则它不能与onReceive()一起工作，这就是为什么它出现在上面。他是空的，但是它作为一个解决问题的方法。

import SwiftUI

//创建视图修饰器
struct DeviceRotationViewMofifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
                action(UIDevice.current.orientation)
            })
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewMofifier(action: action))
    }
}

struct FFDeviceRotation: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("Protrait")
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                Text("Unknown")
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    FFDeviceRotation()
}
