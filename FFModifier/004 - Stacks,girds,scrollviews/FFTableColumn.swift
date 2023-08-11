//
//  FFTableColumn.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何使用Table创建多列列表
//  SwiftUI的Table可以创建包含多列的列表。包括选择和排序功能。它的原理与常规列表不同，因为给Table传递要的是数据数组，并使用key-paths指定要显示的值，同时还需要传递标题以显示在表头区域。如果在iOS17以上，还可以添加DisclosureTableRow实例，使表格可以展开和折叠。
//重要提示： 在iPhone上，表格会向下折叠以显示第一列数据，但在iPad和Mac上，将显示所有数据
import SwiftUI

struct User: Identifiable {
    let id: Int
    var name: String
    var score: Int
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    var city: String
    let birthDate: Date
    var children = [Person]()

    // some example websites
    static let betsy = Person(name: "Betsy Appleseed", city: "San Jose", birthDate: ISO8601DateFormatter().date(from: "1977-01-30T11:28:00+00:00")!)
    static let kate = Person(name: "Kate Appleseed", city: "Los Altos", birthDate: ISO8601DateFormatter().date(from: "1977-02-25T04:15:00+00:00")!)
    static let johnny = Person(name: "Johnny Appleseed", city: "Santa Clara", birthDate: ISO8601DateFormatter().date(from: "1952-06-03T12:45:00+00:00")!, children: [betsy, kate])
    static let tim = Person(name: "Tim Appleseed", city: "Mountain View", birthDate: ISO8601DateFormatter().date(from: "1960-11-01T09:41:00+00:00")!)
}

struct FFTableColumn: View {
    let family: [Person] = [.johnny, .tim]

        @State private var bookmarksExpanded = false

        var body: some View {
            Table(of: Person.self) {
                TableColumn("Name", value: \.name)
                TableColumn("City", value: \.city)
                TableColumn("Birthdate") { person in
                    Text(person.birthDate.formatted(date: .numeric, time: .omitted))
                }
            } rows: {
                ForEach(family) { member in
                    if member.children.isEmpty {
                        TableRow(member)
                    } else {
                        DisclosureTableRow(member) {
                            ForEach(member.children)
                        }
                    }
                }
            }
        }
}

#Preview {
    FFTableColumn()
}
