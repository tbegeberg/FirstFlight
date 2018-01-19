//
//  PrepareHorizontalScrolling.swift
//  FirstFlight
//
//  Created by TørK on 17/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//
import SpriteKit

extension GameScene {
    
    func prepareHorizontalScrolling() {
        
        // Set up scrollView
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), moveableNode: moveableNode, direction: .horizontal)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * scrollViewAdjuster, height: scrollView.frame.height) // * 3 makes it three times as wide as screen
        view?.addSubview(scrollView)
        
        // Set scrollView to first page
        scrollView.setContentOffset(CGPoint(x: 0 + scrollView.frame.width * (scrollViewAdjuster - 1), y: 0), animated: false)
        
        // ScrollView Sprites for each page in scrollView
        // Makes positioning much easier.
        let page1ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page1ScrollView.zPosition = -1
        page1ScrollView.position = CGPoint(x: frame.midX - (scrollView.frame.width * 2), y: frame.midY)
        moveableNode.addChild(page1ScrollView)
        
        let page2ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page2ScrollView.zPosition = -1
        page2ScrollView.position = CGPoint(x: frame.midX - (scrollView.frame.width), y: frame.midY)
        moveableNode.addChild(page2ScrollView)
        
        let page3ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page3ScrollView.zPosition = -1
        page3ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        moveableNode.addChild(page3ScrollView)
  
        
        /*let sprite1Page1 = SKSpriteNode(color: .red, size: spriteSize)
        sprite1Page1.position = CGPoint(x: page1ScrollView.position.x + 50, y: page1ScrollView.position.y + 50)
        page1ScrollView.addChild(sprite1Page1)
        
        let sprite2Page1 = SKSpriteNode(color: .red, size: spriteSize)
        sprite2Page1.position = CGPoint(x: sprite1Page1.position.x + (sprite2Page1.size.width * 1.5), y: sprite1Page1.position.y)
        sprite1Page1.addChild(sprite2Page1)*/
        
        // Test sprites page 2
        let sprite1Page2 = SKSpriteNode(color: .blue, size: spriteSize)
        sprite1Page2.position = CGPoint(x: 0, y: 0)
        page2ScrollView.addChild(sprite1Page2)
        
        let sprite2Page2 = SKSpriteNode(color: .blue, size: spriteSize)
        sprite2Page2.position = CGPoint(x: sprite1Page2.position.x + (sprite2Page2.size.width * 1.5), y: sprite1Page2.position.y)
        sprite1Page2.addChild(sprite2Page2)
        
        // Test sprites page 2
        let sprite1Page3 = SKSpriteNode(color: .green, size: spriteSize)
        sprite1Page3.position = CGPoint(x: 0, y: 0)
        page3ScrollView.addChild(sprite1Page3)
        
        let sprite2Page3 = SKSpriteNode(color: .green, size: spriteSize)
        sprite2Page3.position = CGPoint(x: sprite1Page3.position.x + (sprite2Page3.size.width * 1.5), y: sprite1Page3.position.y)
        sprite1Page3.addChild(sprite2Page3)
    }
}
