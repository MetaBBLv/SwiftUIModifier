//
//  FFControlGroup.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何使用ControlGroup将视图分组在一起
//  SwiftUI的ControlGroupView

import SwiftUI

struct FFControlGroup: View {
    var body: some View {
        ControlGroup {
            Button("First") { }
            Button("Second") { }
            Button("Thread") { }
        }
    }
}

#Preview {
    FFControlGroup()
}
