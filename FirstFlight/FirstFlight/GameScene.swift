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
    static let Banana    : UInt32 = 0b1       // 1
    static let Platform  : UInt32 = 0b10      // 2
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
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.Banana != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Platform != 0)) {
            if let banana = firstBody.node as? SKSpriteNode, let
                platform = secondBody.node as? SKSpriteNode {
                print("hit")
                
                //projectileDidCollideWithMonster(projectile: projectile, monster: monster)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        if let camera = cameraNode, let banana = banana {
            camera.position = banana.position
        }
    }
    

}
