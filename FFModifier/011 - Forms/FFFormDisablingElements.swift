//
//  FFFormDisablingElements.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/10.
//
//  启用和禁用表单中的元素
//  通过使用disable()修饰符，可以禁用form的任何section，甚至整个form。接受一个bool值，用来定义元素是否应该被禁用。form的element的样式会自动更新，以反映其状态--例如，按钮和开关会变灰。

import SwiftUI

struct FFFormDisablingElements: View {
    @State private var agreedToTerms = false
    
    var body: some View {
        Form {
            Section {
                Toggle("Agreen to terms and conditions", isOn: $agreedToTerms)
            }
            Section {
                Button("Continue") {
                    print("Thank you!")
                }
                .disabled(agreedToTerms == false)
            }
            //像许多其他SwiftUI修饰符一样，disabled状态是可以解除的，可以附加到section，可以附加到Form，根据需求来决定禁用某一行还是禁用整块区域。
        }
    }
}

#Preview {
    FFFormDisablingElements()
}
