//
//  Grass.swift
//  FirstFlight
//
//  Created by TørK on 21/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//


import SpriteKit

class GrassSprite: SKSpriteNode {
    class func grass(location: CGPoint) -> GrassSprite {
        let sprite = GrassSprite(imageNamed: "grass")
       
        sprite.position = location
        sprite.name = "grass"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "grass"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.isDynamic = false
            physics.categoryBitMask = PhysicsCategory.Grass
            physics.contactTestBitMask = PhysicsCategory.Banana
            
        }
        return sprite
    }
}
