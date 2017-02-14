//
//  FUButton.swift
//  FUKit
//
//  Created by Craig Edwards on 14/02/2017.
//  Copyright © 2017 BlackDog Foundry Pty Ltd. All rights reserved.
//

import Foundation

class FUButton : FUView {
	typealias FUButtonAction = () -> ()
	
	var action: FUButtonAction?
	
	override func touchesBegan(touches: [FUTouch]) -> Bool {
		action?()
		return true
	}
}
