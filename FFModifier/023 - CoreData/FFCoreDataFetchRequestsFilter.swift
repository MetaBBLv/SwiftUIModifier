//
//  FFCoreDataFetchRequestsFilter.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//
//  如何使用predicate过滤CoreData的fetchRequests
//  CoreData的fetchRequest中可以使用Predicates，就像在UIKit中，所有这些都是通向你的@FetchRequest属性包装器提供一个predicate来实现的。
//

import SwiftUI

struct FFCoreDataFetchRequestsFilter: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    //创建predicate
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "name == %@", "Python")
    ) var languages: FetchedResults<ProgrammingLanguage>
    //目前@FetchRequest使用的是标准的CoreData的Predicate，也可以创建复合Predicate
    
    var body: some View {
        List(languages) { language in
            Text(language.name ?? "UnKnown")
        }
    }
}

#Preview {
    FFCoreDataFetchRequestsFilter()
}
