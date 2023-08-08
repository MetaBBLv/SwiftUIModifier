//
//  FFListSearchTocken.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//  失败的例子，为实现效果
//  如何添加搜索领拍搜索字段
//  SwiftUI的searchable()修饰符可以将搜素栏直接放到NavigationStack中，但除了文本搜索，还可以选择token-pre填充，代表app中特定类别或过滤器。
//实现步骤：
//一个常规searchable实现，根据搜索文本过滤结果
//表示一个搜索令牌的自定义数据类型。你不能只使用字符串或类似的东西，因为SwiftUI要求令牌符合可识别的。
//用户可以从中选择所有令牌的数组，这可能是一个常量数组，也可能好似一个发布的值数组
//用户输入的所有令牌的色狐族，这是所有令牌的自己，应该添加到过滤代码中
//决定如何在列表中承铉耽搁令牌的一些代码。可以是一个文本视图。

//iOS的searchable实现将默认用建议的令牌替换你的搜索结果，这使得默认的搜索功能变得不那么有用。因此，通过“#”符号开头激活令牌。


import SwiftUI

//保存一个唯一可识别的Movie
struct FFMovie: Identifiable {
    var id = UUID()
    var name: String
    var genre: String
}

struct FFToken: Identifiable {
    var id: String { name }
    var name: String
}

struct FFListSearchTocken: View {
    @State private var searchText = ""
    let allTokens = [FFToken(name: "Action"), FFToken(name: "Comedy"), FFToken(name: "Drama"), FFToken(name: "Family"), FFToken(name: "Sci-Fi")]
    @State private var currentTokens = [FFToken]()
    
    var suggestedTokens: [FFToken] {
        if searchText.starts(with: "#") {
            return allTokens
        } else {
            return []
        }
    }
    
    let movies = [
        FFMovie(name: "Avatar", genre: "Sci-Fi"),
        FFMovie(name: "Inception", genre: "Sci-Fi"),
        FFMovie(name: "Love Actually", genre: "Comedy"),
        FFMovie(name: "Paddington", genre: "Family")
    ]
    //根据搜索文本或标记过滤所有电影。
    var searchResults: [FFMovie] {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)
        
        return movies.filter { movie in
            if searchText.isEmpty == false {
                if movie.name.localizedCaseInsensitiveContains(trimmedSearchText) {
                    return false
                }
            }
            
            if currentTokens.isEmpty == false {
                for token in suggestedTokens {
                    if token.name.localizedCaseInsensitiveContains(movie.genre) {
                        return true
                    }
                }
                
                return false
            }
            
            return true
        }
    }
    
    var body: some View {
        NavigationStack {
            List(searchResults) { movie in
                Text(movie.name)
            }
            .navigationTitle("Movies+")
            .searchable(text: $searchText, tokens: $currentTokens, suggestedTokens: .constant(suggestedTokens), prompt: Text("Type to filter, or use # for tags")) { token in
                Text(token.name)
            }
        }
    }
}

#Preview {
    FFListSearchTocken()
}
