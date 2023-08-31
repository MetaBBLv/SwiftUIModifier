//
//  FFCoreDataAddObjects.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何从SwiftUI视图添加Core Data对象
//  在SwiftUI中保存core data对象的工作方式与在SwiftUI之外的工作往事完全相同，访问托管对象的context，在该上下文中创建你的类型的实例，然后在准备好时保存context。



import SwiftUI

struct FFCoreDataAddObjects: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var languages: FetchedResults<ProgrammingLanguage>
    var body: some View {
        //创建实例
        Button("Insert Example Languate") {
            let language = ProgrammingLanguage(context: managedObjectContext)
            language.name = "Python"
            language.creator = "Guido van Rossum"
            PersistenceController.shared.save()
        }
        //在添加一组对象之后，程序会多一组对象。
        List(languages) { language in
            Text(language.name ?? "UnKnown")
        }
    }
}

#Preview {
    FFCoreDataAddObjects()
}
