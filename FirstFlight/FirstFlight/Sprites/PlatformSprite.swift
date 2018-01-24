//
//  Platform.swift
//  FirstFlight
//
//  Created by TørK on 19/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import SpriteKit

class PlatformSprite: SKSpriteNode {
    class func platform(location: CGPoint) -> PlatformSprite {
        let sprite = PlatformSprite(imageNamed: "platform.png")
        
        sprite.xScale = 0.3
        sprite.yScale = 0.3
        sprite.position = location
        sprite.name = "platform"

        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "platform.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.isDynamic = false
            physics.categoryBitMask = PhysicsCategory.Platform
            physics.contactTestBitMask = PhysicsCategory.Banana
            
        }
        return sprite
    }
}
