//
//  Simulator.m
//  FUKit
//
//  Created by Craig Edwards on 12/10/2016.
//  Copyright © 2016 BlackDog Foundry Pty Ltd. All rights reserved.
//

#import "Simulator.h"
#import <Foundation/Foundation.h>
#import <GLUT/GLUT.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

#define LANDSCAPE 1

#if LANDSCAPE
	#define WIDTH  736
	#define HEIGHT 414
#else
	#define WIDTH  414
	#define HEIGHT 736
#endif

// ------------------------------------------------------------
// Internal functions and data
// ------------------------------------------------------------

void (*displayFunction)(void);
void (*touchBeganFunction)(int x, int y);

void internalDisplayFunction(void) {
	glClearColor(0.9f, 0.9f, 0.9f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	
	displayFunction();

	glutSwapBuffers();
}

void internalReshapeFunction(int width, int height) {
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glViewport(0, 0, width, height);
	glOrtho(0, width, 0, height, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

void internalMouseFunction(int button, int state, int x, int y) {
	if (state == GLUT_DOWN && touchBeganFunction) {
		touchBeganFunction(x, y);
	}
}

// ------------------------------------------------------------
// Public API
// ------------------------------------------------------------
void fuGraphicsSetup() {
	int argc = 0;
	char **argv = NULL;
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE);
	glutInitWindowSize(WIDTH, HEIGHT);
	glutInitWindowPosition(500, 180);
	glutCreateWindow("FUKit Simulator");
	
	glutReshapeFunc(internalReshapeFunction);
	
	touchBeganFunction = NULL;
}

void fuGraphicsRun() {
	glutMainLoop();
}

void fuGraphicsSetDisplayFunction(void (*function)(void)) {
	displayFunction = function;
	glutDisplayFunc(internalDisplayFunction);
}

void fuGraphicsSetTouchBeganFunction(void (*function)(int x, int y)) {
	touchBeganFunction = function;
	glutMouseFunc(internalMouseFunction);
}

void fuGraphicsDrawRect(NSRect rect, float red, float green, float blue, float alpha) {
	glColor4f(red, green, blue, alpha);
	
	glBegin(GL_QUADS);
	glVertex2f(rect.origin.x, HEIGHT-rect.origin.y);
	glVertex2f(rect.origin.x+rect.size.width, HEIGHT-rect.origin.y);
	glVertex2f(rect.origin.x+rect.size.width, HEIGHT-rect.origin.y-rect.size.height);
	glVertex2f(rect.origin.x, HEIGHT-rect.origin.y-rect.size.height);
	glEnd();
	
	glutPostRedisplay();
}

#pragma GCC diagnostic pop
