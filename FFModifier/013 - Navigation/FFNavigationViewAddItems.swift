//
//  FFNavigationViewAddItems.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  NavigationView添加bar items
//  toolbar()修饰符允许我们将单个或多个item按钮添加到navigationStack的前面和后面，以及视图的其他部分。这些可能是可点击的按钮，但没有限制-你可以添加任何类型的视图。

import SwiftUI

struct FFNavigationAddBehind: View {
    var body: some View {
        //在导航条的后面添加了两个按钮
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(content: {
                    Button("About") {
                        print("About tapped!")
                    }
                    
                    Button("Help") {
                        print("Help tapped!")
                    }
                    
                })
        }
    }
}

struct FFNavigationAddFront: View {
    var body: some View {
        //我们还没有制定按钮应该显示在哪里，但没有关系--SwiftUI知道在iOS平台上后，后边边缘排列顺序是从左到右的最佳位置，并且会自动将其翻转到另一边，以便获得从右到左的语言。
        //如果想控制按钮的确切位置，你可以通过将其包装在ToolBarItem并制定所需的位置来做到这一点。例如，创建一个按钮，并强制将其放在导航栏前面。
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                })
        }
    }
}

struct FFNavigationToolBarItem: View {
    var body: some View {
        //如果你想在不同位置放置多个item btn，只需要根据多次重复ToolBarIten，并每次指定不同的位置。要将多个item放在相同的位置，需要将他们包装在ToolbarItenmGroup中
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(content: {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("About") {
                            print("About tapped!")
                        }
                        
                        Button("Help") {
                            print("About tapped!")
                        }
                    }
                })
            //这使用.primaryAction位置，他将根据平台（iOS等）认为最重要的按钮的位置来定位按钮。
        }
    }
}

struct FFNavigationViewPlacement: View {
    var body: some View {
        //还有一个.secondaryAction放置，专为有用但不需要操作而设计，在iOS上，将导致改组中的按钮折叠为单个详细信息按钮
        Text("SwiftUI")
            .navigationTitle("Welcome")
            .toolbar(content: {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button("About") {
                        print("About tapped!")
                    }
                    
                    Button("Help") {
                        print("About tapped!")
                    }
                }
                
                ToolbarItemGroup(placement: .secondaryAction) {
                    Button("Settings") {
                        print("Credits tapped!")
                    }
                    
                    Button("Email Me") {
                        print("Email tapped!")
                    }
                }
            })
    }
}

struct FFNavigationViewAddItems: View {
    var body: some View {
        
        NavigationStack {
            List {
                NavigationLink {
                    FFNavigationAddBehind()
                } label: {
                    Text("在导航栏后面添加两个按钮")
                }
                
                NavigationLink {
                    FFNavigationAddFront()
                } label: {
                    Text("在导航栏前面添加按钮")
                }
                
                NavigationLink {
                    FFNavigationToolBarItem()
                } label: {
                    Text("多个item放在相同的位置")
                }
                
                NavigationLink {
                    FFNavigationViewPlacement()
                } label: {
                    Text("通过primaryAction与secondaryAction设置item")
                }
            }
        }
        
    }
}

#Preview {
    FFNavigationViewAddItems()
}
