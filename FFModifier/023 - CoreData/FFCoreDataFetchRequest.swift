//
//  FFCoreDataFetchRequest.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何使用@FetchRequest创建一个核心数据获取请求
//  FetchRequest可以加载符合指定的条件的Core Data结果，并且SwiftUI可以将这些结果直接绑定到用户界面。
//  创建fetchRequest需要两条信息：
//- 要查询的实体
//- 以及确定返回结果顺序的排序描述符。


import SwiftUI
import CoreData

struct FFCoreDataFetchRequest: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    //  SortDescriptors参数是一个数组，所以可以提供尽可能多的排序选项
    @FetchRequest(sortDescriptors: []) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        List(languages) { language in
            Text(language.name ?? "UnKnown")
        }
    }
}

#Preview {
    FFCoreDataFetchRequest()
}
