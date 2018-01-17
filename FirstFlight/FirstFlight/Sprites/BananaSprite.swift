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
        
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.position = location
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "banana.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.isDynamic = true
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
        
    }
   
}
