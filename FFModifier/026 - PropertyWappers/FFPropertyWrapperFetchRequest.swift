//
//  FFPropertyWrapperFetchRequest.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@FetchRequest
//SwiftUI为我们提供了一个专门用于处理CoreData获取请求的属性包装器，可以将数据直接嵌入到SwiftUI视图中，而无需编写额外的逻辑。
//使用@FetchRequest至少提供一个值，即用于排列数据的排序描述符数组，还可以根据需求选择性提供参数来过滤数据。
//在使用@FetchRequest之前，必须将CoreData托管对象上下文注入到环境中，

import SwiftUI

struct FFPropertyWrapperFetchRequest: View {
   
    @Environment(\.managedObjectContext) var managedObjectContext
    //  SortDescriptors参数是一个数组，所以可以提供尽可能多的排序选项
    @FetchRequest(
        sortDescriptors: []
    ) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPropertyWrapperFetchRequest()
}
