//
//  FFListCustomSwipe.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何将自定义侧滑按钮添加至list-row
//  SwiftUI的swipeActions()修饰符可以添加一个或多个滑动button到list-row，可选的控制它们属于哪一边，以及它们是否应该被触发使用一个完整的滑动。

import SwiftUI

struct FFListCustomSwipe: View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]
    @State private var total = 0
    
    var body: some View {
        //button使用了tint进行了作色，如果未使用，默认时灰色的
        List {
            Section {
                Text("Pepperoni pizza")
                    .swipeActions {
                        Button("Order") {
                            print("Awesome!")
                        }
                        .tint(.green)
                    }
                Text("pepperoni with pineapple")
                    .swipeActions {
                        Button("Burn") {
                            print("Right on")
                        }
                        .tint(.red)
                    }
            }
            //对于真正删除性质的按钮，应该通过role设定，避免通过tint指定红色
            //默认情况下，如果用户滑动足够远，将自动触发第一个滑动动作。如果想要禁用，在创建滑动时将allowsFullSwipe设置为false
            Section {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(allowsFullSwipe:false) {
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)
                            
                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }

                        }
                }
            }
            
            Section {
                //如果想要在cell的两端都添加不同的滑动操作，只需要了用两次swipeActions在边缘
                ForEach(1..<100) { i in
                    Text("\(i)")
                        .swipeActions(edge: .leading) {
                            Button {
                                total += i
                            } label: {
                                Label("Add \(i)", systemImage: "plus.circle")
                            }
                            .tint(.indigo)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                total -= i
                            } label: {
                                Label("Subtract \(i)", systemImage: "minus,circle")
                            }
                        }
                }
            } header: {
                Text("Total: \(total)")
            }
            .headerProminence(.increased)
        }
        
        
    }
}

#Preview {
    FFListCustomSwipe()
}
