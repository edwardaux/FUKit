
//
//  FUView.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUView : FUResponder {

	static var animationDuration: TimeInterval = 0
	
	var privateFrame: NSRect
	var frame: NSRect {
		get {
			return self.privateFrame
		}
		set {
			if FUView.animationDuration == 0 {
				self.privateFrame = newValue
			}
			else {
				self.animateFrame(to: newValue, duration: FUView.animationDuration)
			}
		}
	}
	
	
	var superview: FUView?
	var subviews: [FUView]
	var backgroundColor: FUColor
	
	init(frame: NSRect) {
		self.privateFrame = frame
		self.subviews = []
		self.backgroundColor = .white
	}
	
	func addSubview(view: FUView) {
		self.subviews.append(view)
		view.superview = self
		view.nextResponder = self
	}
	
	func removeSubview(view: FUView) {
		if let index = self.subviews.index(of: view) {
			self.subviews.remove(at: index)
		}
	}
	
	func displayIfNeeded() {
		self.drawRect()
		for view in self.subviews {
			view.displayIfNeeded()
		}
	}
	
	func drawRect() {
		let rect = self.absoluteFrame
		let rgba = self.backgroundColor.rgba
		fuGraphicsDrawRect(rect, rgba.0, rgba.1, rgba.2, rgba.3)
	}
	
	var absoluteOrigin: NSPoint {
		if let superview = self.superview {
			return NSPoint(x: superview.absoluteOrigin.x + self.frame.origin.x, y: superview.absoluteOrigin.y + self.frame.origin.y)
		}
		else {
			return self.frame.origin
		}
	}
	
	var absoluteFrame: NSRect {
		return NSRect(origin: self.absoluteOrigin, size: self.frame.size)
	}
	
	func hitTest(point: NSPoint) -> FUView? {
		for view in self.subviews {
			if let hit = view.hitTest(point: point) {
				return hit
			}
		}
		let absoluteFrame = self.absoluteFrame
		if absoluteFrame.contains(point) {
			return self
		}
		return nil
	}

}

extension FUView : Equatable {
	public static func ==(lhs: FUView, rhs: FUView) -> Bool {
		return lhs.frame == rhs.frame
	}
}

extension FUView {
	public static func animateWithDuration(_ duration: TimeInterval, animations: () -> Void) {
		FUView.animationDuration = duration
		animations()
	}
	
	func animateFrame(to target: NSRect, duration: TimeInterval) {
		let sleepInterval = 0.01
		let count: Int = Int(duration / sleepInterval)
		let incrementX = (target.origin.x - self.frame.origin.x) / CGFloat(count)
		let incrementY = (target.origin.y - self.frame.origin.y) / CGFloat(count)
		let incrementWidth = (target.size.width - self.frame.size.width) / CGFloat(count)
		let incrementHeight = (target.size.height - self.frame.size.height) / CGFloat(count)
		DispatchQueue.global().async {
			for _ in 0..<count {
				Thread.sleep(forTimeInterval: sleepInterval)
				let newFrame = NSRect(
					x: self.frame.origin.x + incrementX,
					y: self.frame.origin.y + incrementY,
					width: self.frame.size.width + incrementWidth,
					height: self.frame.size.height + incrementHeight
				)
				self.privateFrame = newFrame
			}
			FUView.animationDuration = 0
		}
	}
}


