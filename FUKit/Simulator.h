//
//  Simulator.h
//  FUKit
//
//  Created by Craig Edwards on 12/10/2016.
//  Copyright © 2016 BlackDog Foundry Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLUT/glut.h>

void fuGraphicsSetup();
void fuGraphicsRun();
void fuGraphicsSetDisplayFunction(void (*function)(void));
void fuGraphicsSetTouchBeganFunction(void (*function)(int x, int y));

void fuGraphicsDrawRect(NSRect rect, float red, float green, float blue, float alpha);

