//
//  FFAppStroeOverlay.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何使用appStoreOverlay()推荐另一个应用。
//  SwiftUI给了我们一个专门的修改器，可以推荐AppStore上的其他应用，这是一个很好的交叉消失的方式。如果你使用的是App Clips，这一点尤其有用，一旦用户完成了主要操作，你就可以从App Clips中推荐完整的应用。
//  这个修饰符需要一些状态来观察，这将决定App Store覆盖是否激活，以及SDKOverlay。确定要推荐哪个应用程序AppConfiguration。
//  重要：appStoreOverlay在macOS上不可用
//  例如，当按钮被按下时，它会推荐一个特定的App

import SwiftUI
import StoreKit

struct FFAppStroeOverlay: View {
    @State private var showRecommended = false
    
    var body: some View {
        Button("Show Recommended App") {
            showRecommended.toggle()
        }
        .appStoreOverlay(isPresented: $showRecommended) {
            SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
        }
        //需要导入StoreKit框架来使用SKOverlay。
    }
}

#Preview {
    FFAppStroeOverlay()
}
