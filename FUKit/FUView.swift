
//
//  FUView.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUView : FUResponder {
	var frame: NSRect
	var superview: FUView?
	var subviews: [FUView]
	var backgroundColor: FUColor
	
	init(frame: NSRect) {
		self.frame = frame
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

