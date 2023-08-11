//
//  FFListSearchBarFilterData.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何添加一个搜索栏来过滤数据
//  SwiftUI的searchable()修饰符可以在NavigationStack中直接添加搜索栏，在简单布局时保持固定，或者在列表一起使用时自动显示和滚动，还可以使用searchScopes()来控制搜索发生的位置。

import SwiftUI

struct FFNormalSearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .navigationTitle("Searchable Normal")
                .searchable(text: $searchText)
        }
    }
}

struct FFIsPresentedSearchBar: View {
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .navigationTitle("Searching: \(searchIsActive ? "YES" : "NO")")
                .searchable(text: $searchText, isPresented: $searchIsActive)
        }
    }
}

struct FFPromptSearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Text("Searching For \(searchText)")
                .navigationTitle("Searchable Prompt")
                .searchable(text: $searchText, prompt: "Look for something")
        }
    }
}

struct FFfilterListDataSearchBar: View {
    @State private var searchText = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText)
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter {
                $0.contains(searchText)
            }
        }
    }
}

struct FFSearchBarSuggestionsSearchBar: View {
    @State private var searchText = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result)?")
                        .searchCompletion(result)
                }
            }
            //比如搜索Holly，输入ho，会弹出提示，这是点击提示，搜索栏将自动补全
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter {
                $0.contains(searchText)
            }
        }
    }
}

struct FFMessage: Identifiable, Codable {
    let id: Int
    let user: String
    let text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct FFScopeSearchBar: View {
    @State private var messages = [FFMessage]()
    @State private var searchText = ""
    @State private var searchScope = SearchScope.inbox
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredmessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)
                        Text(message.text)
                    }
                }
            }
            .navigationTitle("Messages")
            .searchable(text: $searchText)
            .searchScopes($searchScope) {
                ForEach(SearchScope.allCases, id: \.self) {scope in
                    Text(scope.rawValue.capitalized)
                }
            }
            .onAppear(perform: runSearch)
            .onSubmit(of: .search, runSearch)
            .onChange(of: searchScope) {
                runSearch()
            }
        }
    }
    
    var filteredmessages: [FFMessage] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([FFMessage].self, from: data)
        }
    }
}

struct FFListSearchBarFilterData: View {
    @State private var searchText1 = ""
    var body: some View {
        NavigationStack {
            List {
                //如果在二级菜单将searchable附加到NavigationStack上，则无法显示搜索栏
                NavigationLink {
                    FFNormalSearchBar()
                } label: {
                    Text("Search bar")
                }
                //如果想要跟踪搜索当前是否处于活跃状态，在iOS17中，添加一个ispresenting的bool值参数
                NavigationLink {
                    FFIsPresentedSearchBar()
                } label: {
                    Text("Search bar for isActive")
                }
                //提供一个字符串作为搜索框的提示符显示
                NavigationLink {
                    FFPromptSearchBar()
                } label: {
                    Text("Search bar for prompt")
                }
                //过滤数据列表
                NavigationLink {
                    FFfilterListDataSearchBar()
                } label: {
                    Text("Search bar for filter list data")
                }
                //搜索栏添加在list上，默认时隐藏的，需要在list顶部轻轻下拉，才可以显示。
                //对于更高级的用途，searchable()可以设置为建议列表。甚至可以额外的不全信息，以节省用户输入的时间，这是通过将一个函数传给searchable来完成的，该函数包含一个建议的视图，如果你希望用户能够点击完成搜索，添加searchCompletion()修饰符。
                
                //在搜索时提供建议
                NavigationLink {
                    FFSearchBarSuggestionsSearchBar()
                } label: {
                    Text("Search bar for suggestions")
                }
                //对于更高级的搜索，你可以想搜索框添加范围，让用户用过添加searchScopes()修饰符来选择它们想要的搜索类型，这需要绑定到跟宋当前活动搜索范围的某个状态，然后可以使用尾随闭包提供范围
                //搜索所有收件箱还是只搜索自己喜欢的邮件
                NavigationLink {
                    FFScopeSearchBar()
                } label: {
                    Text("Search bar for scope")
                }
            }
            .navigationTitle("FFSearch Bar")
        }
    }
}

#Preview {
    FFListSearchBarFilterData()
}
