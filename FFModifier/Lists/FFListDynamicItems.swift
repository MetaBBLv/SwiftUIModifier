//
//  FFListDynamicItems.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何创建一个动态列表
//  为了处理动态项，你必须首先告诉SwiftUI它如何识别哪个item是哪个。这可以通过手动指定标识属性或使用可识别的协议来完成。协议只有一个要求，即类型必须具有某种类型的id值，SwiftUI可以使用id来标记。


import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

struct RestaurantRow: View {
    let restaurant: Restaurant
    
    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

struct FFListDynamicItems: View {
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]
    
    var body: some View {
        List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
    }
    // 上面大部分的操作都是准备数据，最后一步才是真正的操作，使用List(restaurants)从restaurants数组创建一个列表，对数组中的每个item执行一次闭包，通过RestaurantRow(restaurant: restaurant)创建cell/
}

#Preview {
    FFListDynamicItems()
}
