//
//  GameScene.swift
//  FirstFlight
//
//  Created by TørK on 16/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let spriteSize = CGSize(width: 200, height: 20)
    var scrollView: SwiftySKScrollView?
    let scrollViewAdjuster: CGFloat = 2
    let moveableNode = SKNode()
    var cameraNode: SKCameraNode?
    var banana: SKSpriteNode?

    override func didMove(to view: SKView) {
        
        //self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        self.physicsWorld.contactDelegate = self
        
        
        self.addChild(moveableNode)
        prepareVerticalScrolling()
        
        banana = BananaSprite.banana(location: CGPoint(x: self.frame.midX, y: self.frame.maxY))
        if let newSprite = banana{
            self.addChild(newSprite)
        }
        
        cameraNode = SKCameraNode()
        if let camera = cameraNode {
            self.addChild(camera)
        }
        self.camera = cameraNode
        
        //prepareHorizontalScrolling()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        if let camera = cameraNode, let pl = banana {
            camera.position = pl.position
        }
    }
    

}
