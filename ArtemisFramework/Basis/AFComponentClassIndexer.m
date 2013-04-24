//
//  AFComponentClassIndexer.m
//  ObjectiveArtemis
//
//  Created by Kerberos Zhang on 13-4-24.
//  Copyright (c) 2013年 Kerberos Zhang. All rights reserved.
//

#import "AFComponentClassIndexer.h"

static AFComponentClassIndexer* shared_componentclass_indexer = nil;
@interface AFComponentClassIndexer ()
{
    NSUInteger _nextAvailableIndex;
    NSHashTable* _indexesByClass;
    NSMutableArray* _classesByIndex;
}
@end

@implementation AFComponentClassIndexer
+ (AFComponentClassIndexer*) sharedIndexer
{
    @synchronized (self) {
        if (shared_componentclass_indexer == nil) {
            shared_componentclass_indexer = [[AFComponentClassIndexer alloc] init];
        }
    }
    return shared_componentclass_indexer;
}

- (id) init
{
    if (self = [super init]) {
        _nextAvailableIndex = 0;
        _classesByIndex = [[NSMutableArray alloc] init];
        _indexesByClass = [[NSHashTable alloc] init];
    }
    return self;
}

- (void) dealloc
{
    [_classesByIndex release];
    [_indexesByClass release];
    [super dealloc];
}

- (oneway void) release
{
    return;
}

- (NSUInteger) retainCount
{
    return NSUIntegerMax;
}

- (NSUInteger) indexComponentClass: (Class) componentClass
{
    return NSUIntegerMax;
}
@end