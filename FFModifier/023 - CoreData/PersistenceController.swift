//
//  PersistenceController.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/30.
//

import Foundation
import CoreData

struct PersistenceController {
    //创建单例
    static let shared = PersistenceController()
    //Core Data
    let container: NSPersistentContainer
    //SwiftUI预览配置
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        //创建10个example
        for i in 0..<10 {
            let language = ProgrammingLanguage(context: controller.container.viewContext)
            language.name = "Example Language \(i)"
            language.creator = "A.Programmer \(i)"
        }
        
        return controller
    }()
    //加载Core Data初始化器，将使用内存存储设定为可选值
    init(inMemory: Bool = false) {
        
        //将Main更改为你自己的名
        container = NSPersistentContainer(name: "Main")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null")
        }
        container.loadPersistentStores { descroption, error in
            if let error = error {
                fatalError("BBLv Error: \(error.localizedDescription)")
            }
        }
    }
    //向PersistenceController类添加save方法，以便它检查context是否更改。
    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("save error: \(error.localizedDescription)")
            }
        }
    }
}
