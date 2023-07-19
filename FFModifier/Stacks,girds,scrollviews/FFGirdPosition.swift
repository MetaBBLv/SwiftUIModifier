//
//  FFGirdPosition.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何在fixed Gird中定位视图
//  SwiftUI的GirdView可以创建静态网格视图，并精确控制每行每列中的内容，你可以使用GirdRow标记各个航，然后还可以选择配置每个单元格的宽度

import SwiftUI

struct FFGirdPosition: View {
    @State private var redScore = 0
    @State private var blueScore = 0
    
    var body: some View {
        //创建一个2*2的网格，其中的文本表示每个单元格的位置
        List {
            Section {
                Grid {
                    GridRow {
                        Text("Top Leading")
                            .background(.red)
                        Text("Top Trailing")
                            .background(.orange)
                    }
                    GridRow {
                        Text("Bottom Leading")
                            .background(.red)
                        Text("Bottom Trainling")
                            .background(.blue)
                    }
                }
                .font(.title)
            }
            
            Section {
                //如果你不希望每行中有相同数量的单元格，有三种方式。首先，如果什么都不做，SwiftUI将自动插入空单元格，以确保行数相等。因此，在此代码中，我们可以自由的添加红色和蓝色的数量，并且SwiftUI会保持整个布局的平衡
                Grid {
                    GridRow {
                        Text("red")
                        ForEach(0..<redScore, id: \.self) { _ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 20, height: 20)
                        }
                    }
                    GridRow {
                        Text("blue")
                        ForEach(0..<blueScore, id: \.self) { _ in
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .font(.title)
                
                Button("Add to Red") {
                    redScore += 1
                }
                
                Button("Add to Blue") {
                    blueScore += 1
                }
            }
            
            Section {
                //第二个方法是将视图放入Gird中，而不是将它们包装在GirdRow中，这将导致它们自己占据整行，这对于分隔符视图非常有用，第三种方法选择使用girdCellColumns()修饰符，使一个单元格跨多个列
                Grid {
                    GridRow {
                        Text("Food")
                        Text("$200")
                    }
                    GridRow {
                        Text("Tent")
                        Text("$800")
                    }
                    GridRow {
                        Text("Candles")
                        Text("$36200")
                    }
                    
                    Divider()
                    GridRow {
                        Text("$4600")
                            .gridCellColumns(2)
                            .multilineTextAlignment(.trailing)
                    }
                }
                //正如事例所示，使用具有相同数列数的‘gridCellColumns()’方法与将视图放在GridRow中得到的结果相同
            }
            .font(.title)
            
            Section {
                //使用网格创建一个井字棋游戏版
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    GridRow {
                        Image(systemName: "xmark")
                        Image(systemName: "xmark")
                        Image(systemName: "xmark")
                    }
                    GridRow {
                        Image(systemName: "circle")
                        Image(systemName: "xmark")
                        Image(systemName: "circle")
                    }
                    GridRow {
                        Image(systemName: "xmark")
                        Image(systemName: "circle")
                        Image(systemName: "circle")
                    }
                }
                .font(.largeTitle)
            }
            
            Section {
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    ForEach(0..<8) { row in
                        GridRow {
                            ForEach(0..<8) { col in
                                if (row + col).isMultiple(of: 2) {
                                    Rectangle()
                                        .fill(.black)
                                } else {
                                    Rectangle()
                                        .fill(.red)
                                }
                            }
                        }
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .border(.black, width: 1)
                .padding()
            }
        }
    }
}

#Preview {
    FFGirdPosition()
}
