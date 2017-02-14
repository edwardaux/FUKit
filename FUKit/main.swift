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

let app = FUApplication.shared
app.addWindow(window: window1)
app.addWindow(window: window2)
app.run()

