//
//  BananaSprite.swift
//  FirstFlight
//
//  Created by TørK on 17/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import SpriteKit

class BananaSprite: SKSpriteNode {
    class func banana(location: CGPoint) -> BananaSprite {
        let sprite = BananaSprite(imageNamed:"banana.png")
        
        sprite.xScale = 0.3
        sprite.yScale = 0.3
        sprite.position = location
        sprite.name = "banana"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "banana.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = false
            physics.isDynamic = true

            physics.categoryBitMask = PhysicsCategory.Banana
            physics.contactTestBitMask = PhysicsCategory.Platform
            physics.contactTestBitMask = PhysicsCategory.Grass
            physics.collisionBitMask = PhysicsCategory.Wall
        }
        return sprite
        
    }
   
}
