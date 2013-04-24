//
//  AFComponentClassIndexer.h
//  ObjectiveArtemis
//
//  Created by Kerberos Zhang on 13-4-24.
//  Copyright (c) 2013年 Kerberos Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFComponentClassIndexer : NSObject
+ (AFComponentClassIndexer*) sharedIndexer;
- (NSUInteger) indexComponentClass: (Class) componentClass;
@end
