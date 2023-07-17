//
//  FFViewDynamicallyAppearanceRota.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//

import SwiftUI

struct FFViewDynamicallyAppearanceRota: View {
    @State private var rotationAmount = 0.0
    
    var body: some View {
        Grid {
            ForEach(0..<3) {_ in
                GridRow{
                    ForEach(0..<3) {_ in
                        Circle()
                            .fill(.green)
                            .frame(width: 100, height: 100)
                            .visualEffect { content, proxy in
                                content.hueRotation(.degrees(proxy.frame(in: .global).midY / 2))
                            }
                    }
                }
            }
        }
        .rotationEffect(.degrees(rotationAmount))
        .onAppear {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                rotationAmount = 360
            }
        }
    }
}

#Preview {
    FFViewDynamicallyAppearanceRota()
}
