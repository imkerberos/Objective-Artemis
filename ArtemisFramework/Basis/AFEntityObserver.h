//
// Created by Kerberos Zhang on 13-4-19.
// Copyright (c) 2013 Kerberos Zhang. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class AFEntity;

@protocol AFEntityObserver <NSObject>
- (void) entityAdded: (AFEntity*) entity;
- (void) entityChanged: (AFEntity*) entity;
- (void) entityDeleted: (AFEntity*) entity;
- (void) entityEnabled: (AFEntity*) entity;
- (void) entityDisabled: (AFEntity*) entity;
@end