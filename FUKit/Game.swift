//
//  Game.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class Bird : FUSprite {
	init(frame: NSRect) {
		super.init(frame: frame, sprite: [
			"------------BBBBBBBBBBBB----------",
			"------------BBBBBBBBBBBB----------",
			"--------BBBBWWWWWWBBWWWWBB--------",
			"--------BBBBWWWWWWBBWWWWBB--------",
			"------BBWWWWCCCCBBWWWWWWWWBB------",
			"------BBWWWWCCCCBBWWWWWWWWBB------",
			"--BBBBBBBBCCCCCCBBWWWWWWBBWWBB----",
			"--BBBBBBBBCCCCCCBBWWWWWWBBWWBB----",
			"BBWWWWWWWWBBCCCCBBWWWWWWBBWWBB----",
			"BBWWWWWWWWBBCCCCBBWWWWWWBBWWBB----",
			"BBWWWWWWWWWWBBCCCCBBWWWWWWWWBB----",
			"BBWWWWWWWWWWBBCCCCBBWWWWWWWWBB----",
			"BBCCWWWWWWCCBBCCCCCCBBBBBBBBBBBB--",
			"BBCCWWWWWWCCBBCCCCCCBBBBBBBBBBBB--",
			"--BBCCCCCCBBCCCCCCBBMMMMMMMMMMMMBB",
			"--BBCCCCCCBBCCCCCCBBMMMMMMMMMMMMBB",
			"----BBBBBBCCCCCCBBMMBBBBBBBBBBBB--",
			"----BBBBBBCCCCCCBBMMBBBBBBBBBBBB--",
			"----BBCCCCCCCCCCCCBBMMMMMMMMMMBB--",
			"----BBCCCCCCCCCCCCBBMMMMMMMMMMBB--",
			"------BBBBCCCCCCCCCCBBBBBBBBBB----",
			"------BBBBCCCCCCCCCCBBBBBBBBBB----",
			"----------BBBBBBBBBB--------------",
			"----------BBBBBBBBBB--------------"
			])
	}
	
	func flap() {
		DispatchQueue.main.async {
			self.frame.origin.y = self.frame.origin.y - 20
		}
	}
	func sink() {
		DispatchQueue.main.async {
			self.frame.origin.y = self.frame.origin.y + 1
		}
	}
}

class Pipe : FUView {
	override init(frame: NSRect) {
		super.init(frame: frame)
		self.backgroundColor = .cyan
	}
	
	func move() {
		DispatchQueue.main.async {
			self.frame.origin.x = self.frame.origin.x - 5
		}
	}
}

class Game : FUWindow {
	var running: Bool
	var bird: Bird
	var pipes: [Pipe]
	
	override init(frame: NSRect) {
		self.running = false
		self.bird = Bird(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
		self.pipes = []
		super.init(frame: frame)
	}
	
	override func touchesBegan(touches: [FUTouch]) -> Bool {
		if self.running {
			self.bird.flap()
		}
		else {
			self.start()
		}
		return true
	}
	
	func start() {
		var i = 0
		
		self.contentView.backgroundColor = .white
		self.bird.frame = NSRect(x: 50, y: (self.frame.size.height / 2), width: 34, height: 24)
		self.contentView.addSubview(view: self.bird)
		
		DispatchQueue.global().async {
			self.running = true
			while self.running {
				Thread.sleep(forTimeInterval: 0.01)
				
				// bird management
				self.bird.sink()
				
				// pipe management
				for pipe in self.pipes {
					pipe.move()
					if pipe.frame.origin.x <= 0 {
						self.contentView.removeSubview(view: pipe)
						self.pipes.remove(at: self.pipes.index(of: pipe)!)
					}
				}
				
				if i % 100 == 0 {
					let height1 = CGFloat(100 + arc4random_uniform(100))
					let height2 = CGFloat(100 + arc4random_uniform(100))
					let pipe1 = Pipe(frame: NSRect(x: self.frame.size.width, y: 0, width: 100, height: height1))
					let pipe2 = Pipe(frame: NSRect(x: self.frame.size.width, y: self.frame.size.height - height2, width: 100, height: height2))
					self.contentView.addSubview(view: pipe1)
					self.contentView.addSubview(view: pipe2)
					self.pipes.append(pipe1)
					self.pipes.append(pipe2)
					i = 0
				}
				i = i + 1
				
				// collision checking
				for pipe in self.pipes {
					if NSIntersectsRect(self.bird.frame, pipe.frame) {
						// game over
						self.pipes.removeAll()
						self.contentView.subviews.removeAll()
						self.contentView.backgroundColor = .magenta
						self.running = false
					}
				}
			}
		}
	}
}
