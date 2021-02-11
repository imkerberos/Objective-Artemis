//
// Created by Kerberos Zhang on 13-4-19.
// Copyright (c) 2013 Kerberos Zhang. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AFAspect.h"

@interface AFAspect ()
{
    NSMutableIndexSet* _allSet;
    NSMutableIndexSet* _excludeSet;
    NSMutableIndexSet* _oneSet;
}
@end

@implementation AFAspect

- (id) init
{
    if (self = [super init]) {
        _allSet = [[NSMutableIndexSet alloc] init];
        _excludeSet = [[NSMutableIndexSet alloc] init];
        _oneSet = [[NSMutableIndexSet alloc] init];
    }
    
    return self;
}

- (void) dealloc
{
    [_allSet release];
    [_excludeSet release];
    [_oneSet release];
    [super dealloc];
}

@end