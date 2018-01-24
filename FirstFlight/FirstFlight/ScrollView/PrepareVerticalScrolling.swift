//
//  PrepareVerticalScrolling.swift
//  FirstFlight
//
//  Created by TørK on 17/01/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func prepareVerticalScrolling() {
        
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), moveableNode: moveableNode, direction: .vertical)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * scrollViewAdjuster) 
        view?.addSubview(scrollView)
        
        let page1ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page1ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        moveableNode.addChild(page1ScrollView)
        
        let page2ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page2ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - (scrollView.frame.height))
        moveableNode.addChild(page2ScrollView)
        
        /*
        let page3ScrollView = SKSpriteNode(color: .clear, size: scrollView.frame.size)
        page3ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - (scrollView.frame.height * 2))
        moveableNode.addChild(page3ScrollView)*/
        
       
     
    }
}


