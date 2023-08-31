//
//  FFCoreDataDeleteObjects.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何从SwiftUI视图中删除CoreData对象
//  在SwiftUI中删除CoreData对象与在UIKit中删除他们基本相同，尽管需要跳过一些特殊的步骤才能与SwiftUI视图集成。


import SwiftUI

struct FFCoreDataDeleteObjects: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        sortDescriptors: []
    ) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        //无论在哪里显示数据，都向SwiftUI视图添加onDelete修饰符。
        List {
            ForEach(languages) { language in
                Text("Creator: \(language.creator ?? "Anonymous")")
            }
            .onDelete(perform: { indexSet in
                removelanguages(at: indexSet)
            })
        }
        .toolbar(content: {
            EditButton()
        })
    }
    
    func removelanguages(at offsets: IndexSet) {
        for index in offsets {
            let language = languages[index]
            managedObjectContext.delete(language)
        }
        PersistenceController.shared.save()
    }
}

#Preview {
    FFCoreDataDeleteObjects()
}
