//
//  FFListStaticitems.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何创建一个静态项目列表
//  要创建项目的静态列表，首先要定义列表中每一行应该是什么样子。这是一个与其他视图一样的视图，并且可以为你打算在行中显示的数据提供任何参数。一旦有了行，就可以创建一个List视图，该视图可以根据需要创建任意多的行

import SwiftUI

struct Pizzeria: View {
    let name: String
    
    var body: some View {
        Text("Restaurant: \(name)")
    }
}

struct FFListStaticitems: View {
    var body: some View {
        //例如，定义一个Pizzeria视图，它将显示一个名称字符串，然后将其用作带有三个固定数据快的Lists的一行。
        List {
            Pizzeria(name: "Joe's Original")
            Pizzeria(name: "The Real Joe's Original")
            Pizzeria(name: "Original Joe's")
        }
    }
}

#Preview {
    FFListStaticitems()
}
