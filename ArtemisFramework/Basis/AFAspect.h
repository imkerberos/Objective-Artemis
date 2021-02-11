//
// Created by Kerberos Zhang on 13-4-19.
// Copyright (c) 2013 Kerberos Zhang. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface AFAspect : NSObject
+ (AFAspect*) aspect;
+ (AFAspect*) aspectWithAll: (Class) compoClass1, ...;
+ (AFAspect*) aspectWithExlude: (Class) compoClass1, ...;
+ (AFAspect*) aspectWithOne: (Class) compoClass1, ...;

- (void) allWith: (Class) compoClass1, ...;
- (void) excludeWith: (Class) compoClass1, ...;
- (void) oneWith: (Class) compoClass1, ...;
@end