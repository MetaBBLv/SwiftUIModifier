//
//  FFListMoveRows.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何让用户可以移动list中的row
//  SwiftUI的moveDisabled修饰符可以移动行

import SwiftUI

struct FFListMoveRows: View {
    @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]
    @State private var usres1 = ["BBlv", "Taylor", "Paul"]
    var body: some View {
        
        List($users, id: \.self, editActions: .move) { $user in
            Text(user)
        }
        
        //通过moveDisable()修饰符和条件来移动rows
        List($users, id: \.self, editActions: .move) { $user in
            Text(user)
                .moveDisabled(user == "Glenn")
        }
        
        NavigationStack {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onMove(perform: { indices, newOffset in
                    move(from: indices, to: newOffset)
                })
            }
            .toolbar {
                EditButton()
            }
        }
    }
    //对于更复杂的move方法，将onMove(preform:)修饰符附加到list中
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    FFListMoveRows()
}
