//
//  GameScene.swift
//  FirstFlight
//
//  Created by TørK on 16/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let spriteSize = CGSize(width: 200, height: 20)
    var scrollView: SwiftySKScrollView?
    let scrollViewAdjuster: CGFloat = 2
    let moveableNode = SKNode()

    override func didMove(to view: SKView) {
        
   
        addChild(moveableNode)
        prepareVerticalScrolling()
        //prepareHorizontalScrolling()
    }

}
