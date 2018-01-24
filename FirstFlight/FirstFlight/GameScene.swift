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
    static let Banana    : UInt32 = 1
    static let Platform  : UInt32 = 2
    static let Grass     : UInt32 = 3
    static let Wall      : UInt32 = 4
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let spriteSize = CGSize(width: 200, height: 20)
    var scrollView: SwiftySKScrollView?
    let scrollViewAdjuster: CGFloat = 2
    let moveableNode = SKNode()
    var cameraNode: SKCameraNode?
    var banana: SKSpriteNode?
    

    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.white
        self.size = CGSize(width: self.size.width, height: self.size.height * 3)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.3)
        self.physicsWorld.contactDelegate = self
        self.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        
        banana = BananaSprite.banana(location: CGPoint(x: self.frame.midX, y: self.frame.midY))
        guard let bananaSprite = banana else {
            return
        }
        self.addChild(bananaSprite)
        
        cameraNode = SKCameraNode()
        guard let camera = cameraNode else {
            return
        }
        self.addChild(camera)
        self.camera = cameraNode
        
        let zeroRange = SKRange(constantValue: 0.0)
        let bananaLocationConstraint = SKConstraint.distance(zeroRange, to: bananaSprite)
        
        let xRange = SKRange(lowerLimit: self.frame.minX, upperLimit: self.frame.maxX)
        let yRange = SKRange(lowerLimit: self.frame.minY + self.frame.maxY/6, upperLimit: self.frame.maxY)
        let levelEdgeConstraint = SKConstraint.positionX(xRange, y: yRange)
    
        camera.constraints = [bananaLocationConstraint, levelEdgeConstraint]
       
        let platform1Page1 = PlatformSprite.platform(location: CGPoint(x: self.frame.midX, y: self.frame.minY + 200))
        self.addChild(platform1Page1)
        
        let platform1Page2 = PlatformSprite.platform(location: CGPoint(x: self.frame.midX, y: self.frame.midY - 250))
        self.addChild(platform1Page2)
        
        let grassBottom = GrassSprite.grass(location: CGPoint(x: self.frame.midX, y: self.frame.minY))
        grassBottom.size.width = self.size.width
        self.addChild(grassBottom)
        
        //self.addChild(moveableNode)
        //prepareVerticalScrolling()

        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        print(touchLocation)
        for banana in self.children {
            if touchLocation.x > self.frame.midX {
                banana.physicsBody?.applyImpulse(CGVector(dx: -1, dy: 0))
            } else {
                banana.physicsBody?.applyImpulse(CGVector(dx: +1, dy: 0))
            }
        }
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
            (secondBody.categoryBitMask == PhysicsCategory.Grass)) {
            if let banana = firstBody.node as? SKSpriteNode {
                banana.removeFromParent()
                
            }
        }
    }
    
    
}
