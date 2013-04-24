//
//  AFSystemClassIndexer.h
//  ObjectiveArtemis
//
//  Created by Kerberos Zhang on 13-4-24.
//  Copyright (c) 2013年 Kerberos Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFSystemClassIndexer : NSObject
+ (AFSystemClassIndexer*) sharedIndexer;
- (NSUInteger) indexSystemClass: (Class) systemClass;
@end
