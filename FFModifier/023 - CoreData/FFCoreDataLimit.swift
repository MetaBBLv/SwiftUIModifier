//
//  FFCoreDataLimit.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何限制获取FetchRequest中的item数量（分页）
//  SwiftUI的@FetchRequest属性包装器非常适合对Object发出简单request，提供排序和过滤功能。但是，如果想调整返回item的数量，那么需要额外设置


import SwiftUI
import CoreData

struct FFCoreDataLimit: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    //创建@FetchRequest
    @FetchRequest var languages: FetchedResults<ProgrammingLanguage>
    
    init() {
        let request: NSFetchRequest<ProgrammingLanguage> = ProgrammingLanguage.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)
        ]
        request.fetchLimit = 10
        _languages = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        List(languages) { language in
            Text(language.name ?? "UnKnown")
        }
    }
}

#Preview {
    FFCoreDataLimit()
}
