//
// Created by Kerberos Zhang on 13-4-19.
// Copyright (c) 2013 Kerberos Zhang. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Entity;

@protocol EntityDelegate <NSObject>
- (void) entityAdded: (Entity*) entity;
- (void) entityChanged: (Entity*) entity;
- (void) entityDeleted: (Entity*) entity;
- (void) entityEnabled: (Entity*) entity;
- (void) entityDisabled: (Entity*) entity;
@end