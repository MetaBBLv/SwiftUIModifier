//
//  FFViewOffset.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何使用offset调整偏移视图位置。
//  所有视图在层次结构中都有一个自然位置，但是Offset()修饰符允许您相对于该自然位置移动他们。这在ZStack中特别有用，它允许您控制视图应该如何重叠。
//  重要提示：使用offset()将导致视图相对于其自然位置移动，但不会影响视图的位置或便宜之后防止的任何其他修饰符。这意味着你需要仔细考虑如何使用它，尤其是要确保视图不会重叠。
//  例如，在这个VStack中，我们可以使用Offset()将第二个View向下移动15个点，结果是与第三个View重叠了

import SwiftUI

struct FFViewOffset: View {
    var body: some View {
        Text("Home")
        Text("Options")
            .offset(y: 15)
        Text("Help")
        //你通常会发现，将padding()与offset()一起使用会得到你想要的结果，因为这会移动一个视图。同时还会自动调整旁边的视图。
        Divider()
        Text("Home")
        Text("Options")
            .offset(y: 15)
            .padding(.bottom, 15)
        Text("Help")
        Divider()
        //任何放在offset()之后的修饰符都不会收到位置变化的影响，这可能会导致意想不到的结果。我在偏移量之前和之后都使用了background()
        HStack {
            Text("Before")
                .background(.red)
                .offset(y: 15)
            Text("After")
                .offset(y: 15)
                .background(.green)
        }
        
        Group {
            //当与ZStack结合时，偏移量让我们将一个视图放置在另一个视图中，用于控制ZStack的对齐
            ZStack(alignment: .bottomTrailing) {
                Image(.filletSteak)
                Text("Photo credit: Meta BBLv")
                    .padding(4)
                    .background(.black)
                    .foregroundStyle(.white)
                    .offset(x: -15 ,y: -5)
                
            }
        }
    }
}

#Preview {
    FFViewOffset()
}
