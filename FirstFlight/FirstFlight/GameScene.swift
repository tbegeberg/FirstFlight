//
//  GameScene.swift
//  FirstFlight
//
//  Created by TørK on 16/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Banana    : UInt32 = 1       // 1
    static let Platform  : UInt32 = 2     // 2
    static let Wall: UInt32 = 3
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let spriteSize = CGSize(width: 200, height: 20)
    var scrollView: SwiftySKScrollView?
    let scrollViewAdjuster: CGFloat = 2
    let moveableNode = SKNode()
    var cameraNode: SKCameraNode?
    var banana: SKSpriteNode?

    override func didMove(to view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.1)
        self.physicsWorld.contactDelegate = self
        self.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        banana = BananaSprite.banana(location: CGPoint(x: self.frame.midX, y: self.frame.maxY))
        if let newSprite = banana{
            moveableNode.addChild(newSprite)
        }

        self.addChild(moveableNode)
        prepareVerticalScrolling()

        cameraNode = SKCameraNode()
        if let camera = cameraNode {
            self.addChild(camera)
        }
        self.camera = cameraNode
    }

    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        if let camera = cameraNode, let banana = banana {
            camera.position = banana.position
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        print(touchLocation)
        for banana in moveableNode.children {
            if touchLocation.x > self.frame.midX {
                banana.physicsBody?.applyImpulse(CGVector(dx: -1, dy: 0))
            } else {
                banana.physicsBody?.applyImpulse(CGVector(dx: +1, dy: 0))
            }
            
            
        }
        
    }
    

}
