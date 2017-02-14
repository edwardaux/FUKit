//
//  main.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

let window1 = FUWindow(frame: NSRect(x: 10, y: 10, width: 150, height: 150))
let view1 = FUView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
view1.backgroundColor = .cyan
window1.contentView.addSubview(view: view1)

let window2 = FUWindow(frame: NSRect(x: 210, y: 210, width: 150, height: 150))
let view2 = FUView(frame: NSRect(x: 80, y: 80, width: 50, height: 50))
view2.backgroundColor = .magenta
let view3 = FUView(frame: NSRect(x: 5, y: 5, width: 10, height: 10))
view3.backgroundColor = .black
view2.addSubview(view: view3)
window2.contentView.addSubview(view: view2)

let window3 = FUWindow(frame: NSRect(x: 10, y: 210, width: 150, height: 150))
let lines = [
	"BBBBBBBBBBBBBBBBBBBB",
	"BBBBBBBBBBBBBBBBBBBB",
	"BBBBBBBBBBBBBBBBBBBB",
	"BBBBBBBBBBBBBBBBBBBB",
	"BBBBBBBBBBBBBBBBBBBB",
	"BBBBBBBBBBBBBBBBBBBB",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"MMMMMM--------MMMMMM",
	"CCCCCCCCCCCCCCCCCCCC",
	"CCCCCCCCCCCCCCCCCCCC",
	"CCCCCCCCCCCCCCCCCCCC",
	"CCCCCCCCCCCCCCCCCCCC",
	"CCCCCCCCCCCCCCCCCCCC",
	"CCCCCCCCCCCCCCCCCCCC"
]
let sprite = FUSprite(frame: NSRect(x: 10, y: 10, width: 20, height: 20), sprite: lines)
window3.contentView.addSubview(view: sprite)

let window4 = FUWindow(frame: NSRect(x: 210, y: 10, width: 150, height: 150))
let button = FUButton(frame: NSRect(x: 50, y: 50, width: 50, height: 20))
button.backgroundColor = .magenta
button.action = {
	FUView.animateWithDuration(1.0) {
		view1.frame = NSRect(x: 50, y: 120, width: 5, height: 5)
	}
}
window4.contentView.addSubview(view: button)

let app = FUApplication.shared
app.addWindow(window: window1)
app.addWindow(window: window2)
app.addWindow(window: window3)
app.addWindow(window: window4)
app.run()

