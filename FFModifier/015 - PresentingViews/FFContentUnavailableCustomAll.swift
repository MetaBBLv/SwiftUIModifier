//
//  FFContentUnavailableCustomAll.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/18.
//

import SwiftUI

struct FFContentUnavailableCustomAll: View {
    var body: some View {
        //完全自定义所有的内容
        ContentUnavailableView("No favorites", systemImage: "star", description: Text("You don't have any favorites yet."))
            .symbolVariant(.slash)
    }
}

#Preview {
    FFContentUnavailableCustomAll()
}
