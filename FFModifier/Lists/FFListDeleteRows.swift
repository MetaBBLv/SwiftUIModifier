//
//  FFListDeleteRows.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何让用户从List中删除行
//  SwiftUI提供了两种方法让我们从列表中删除row：一种是iOS16.0或更高版本支持的简单方法，另一种更高级的方法也适用于更老的iOS版本，无论选择哪种方法，都可以使用deleteDisabled()修饰符选择性的禁用行删除。
//  如果你只想让用户滑动从数组中删除项，而不添加任何额外的逻辑，那么简单的方法非常有效，要使用它，使用与列表的数据绑定，并传入editActions参数

import SwiftUI

struct FFListDeleteRows: View {
    @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]
    @State private var users1 = ["BBlv", "Taylor", "Paul"]
    var body: some View {
        NavigationStack {
            //这让用户可以立即滑动来删除行，并且用户数组将在他们这样做是更新，如果你想让他们也可以移动row，将.delete 改成。all
            List($users, id: \.self, editActions: .delete) { $user in
                Text(user)
            }
            
            //如果希望禁用一行的删除，可以使用deleteDisabled()和你拥有的任何条件。例如，用户可以随意的删除，但至少满足row > 1
            List($users, id: \.self, editActions: .delete) { $user in
                Text(user)
                    .deleteDisabled(users.count < 2)
            }
            //在这里，你通常会想要调用Swift的remove(at Offsets:)方法从你的序列中删除行。因为SwiftUI正在监视你的状态，你所做的任何更改都会自动反应在你的UI中。例如，创建一个包含三个项目的ContentView结构体，然后附加一个onDelete(perform:)修饰符，从列表中删除row
            List {
                ForEach(users1, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: { indexSet in
                    delete(at: indexSet)
                })
                .navigationTitle("Users")
            }
            //onDelete()作为ForEach的修饰符，不能直接用于List，这是因为列表中包含静态行
            
        }
    }
    
    //对于更复杂的删除方法，将onDelete(perform:)修饰符附加到列表中的ForEach，并让它发生在删除操作时调用我们选择的这个方法，这个处理需要有一个特定的签名来接受多个索引来删除
    func delete(at offsets: IndexSet) {
        users1.remove(atOffsets: offsets)
    }
}

#Preview {
    FFListDeleteRows()
}
