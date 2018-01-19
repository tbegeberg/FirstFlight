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
        
        sprite.position = location

        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "platform.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            
            physics.categoryBitMask = PhysicsCategory.Platform
            physics.contactTestBitMask = PhysicsCategory.Banana
            //physics.collisionBitMask = PhysicsCategory.Banana
            
        }
        return sprite
        
    }
    
}
