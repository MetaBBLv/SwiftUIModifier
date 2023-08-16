//
//  FFPurchases.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  如何在SwiftUI中添加应用内购
//  如果导入StoreKit，可以使用SotreView、SubscriptionStoreView和ProductView向用户展示应用内购买可包括处理启动购买过程。这仍然给你留下了闲荡多的SotreKit工作要完成，包括处理实际的购买交易等等，但我不排除苹果要求应用在未来的版本中使用这个标准化的接口。
//

import SwiftUI
import StoreKit

struct FFPurchases: View {
    var body: some View {
        //最简单的操作，只需要添加一个带有单个产品标识符的ProductView
        ProductView(id: "com.hackingwithswift.plus.subscription")
        Divider()
        //然而，在真实场景中，你可能想要配置产品的外观，比如调整布局或添加其他样式。
        VStack {
            Text("Welcome to my store")
                .font(.title)
            ProductView(id: "com.hackingwithswift.plus.subscription") {
                Image(systemName: "crown")
            }
            .productViewStyle(.compact)
            .padding()
        }
        //如果你想同时显示多个Product，你可以在自定义UI中创建ProductView实例组，或者切换到带有你想要显示的产品id列表的StoreView
        VStack {
            Text("Hacking with Swift +")
                .font(.title)
            StoreView(ids: ["com.hackingwithswift.plus.subscription", "com.hackingwithswift.plus.lifetime"])
        }
        Spacer()
        
    }
}

#Preview {
    FFPurchases()
}
