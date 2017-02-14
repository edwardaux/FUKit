//
//  FUSprite.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUSprite : FUView {
	let lines: [String]
	
	init(frame: NSRect, sprite: [String]) {
		self.lines = sprite
		super.init(frame: frame)
	}
	
	override func drawRect() {
		for (y, line) in self.lines.enumerated() {
			for (x, c) in line.characters.enumerated() {
				let color: FUColor?
				switch c {
				case "B": color = .black
				case "W": color = .white
				case "C": color = .cyan
				case "M": color = .magenta
				default:  color = nil
				}
				if let color = color {
					let origin = self.absoluteOrigin
					let pixel = CGRect(origin: CGPoint(x: origin.x + CGFloat(x), y: origin.y + CGFloat(y)), size: CGSize(width: 1, height: 1))
					let rgba = color.rgba
					fuGraphicsDrawRect(pixel, rgba.0, rgba.1, rgba.2, rgba.3)
				}
			}
		}
	}
}
