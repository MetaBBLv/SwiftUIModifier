//
//  FFSpriteView.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI中可以的SpriteView可以渲染任何子类，如果有需求，SKScene可以调整场景大小

import Foundation
import SwiftUI
import SpriteKit

struct FFSpriteView: View {
    
    var scene: SKScene {
        let scene = FFGameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}

#Preview {
    FFSpriteView()
}
