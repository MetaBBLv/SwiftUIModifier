//
//  FFGameScene.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//

import Foundation
import SpriteKit

//创建一个游戏场景，无论点击哪里，这都会创建下落的盒子，并添加物理效果
class FFGameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
}
