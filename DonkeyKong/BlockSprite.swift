//
//  BlockSprite.swift
//  DonkeyKong
//
//  Created by Travis Pell on 03/03/2020.
//  Copyright © 2020 Travis Pell. All rights reserved.
//

import Foundation
import SpriteKit

class BlockSprite : SKShapeNode {
    private var jumpCount = 0
    
    override init() {
        super.init()
    }
    
    convenience init(x: CGFloat, y: CGFloat) {
        self.init()
        
        self.path = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: 50, height: 50), cornerRadius: 1).cgPath
        self.fillColor = UIColor.brown
        self.lineWidth = 7
        self.physicsBody = SKPhysicsBody(edgeChainFrom: self.path!)
        self.physicsBody?.restitution = 0.4
        self.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Allows single and double jumps
    func jump() {
        print(String(describing: self.physicsBody?.velocity.dy))
        if ((self.physicsBody?.velocity.dy.isLessThanOrEqualTo(CGFloat(0.1)))!) {
            jumpCount = 0
        }
        if (jumpCount == 0 && (self.physicsBody?.velocity.dy)! >= CGFloat(0)) {
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 150))
            jumpCount += 1
        } else if (jumpCount == 1 && (self.physicsBody?.velocity.dy)! >= CGFloat(0)) {
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 75))
            jumpCount += 1
        }
    }
}
