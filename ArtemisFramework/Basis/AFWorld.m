/**
* Based on Artemis Entity System Framework
* 
* Copyright 2011 GAMADU.COM. All rights reserved.
* 
* Redistribution and use in source and binary forms, with or without modification, are
* permitted provided that the following conditions are met:
* 
*    1. Redistributions of source code must retain the above copyright notice, this list of
*       conditions and the following disclaimer.
* 
*    2. Redistributions in binary form must reproduce the above copyright notice, this list
*       of conditions and the following disclaimer in the documentation and/or other materials
*       provided with the distribution.
* 
* THIS SOFTWARE IS PROVIDED BY GAMADU.COM ``AS IS'' AND ANY EXPRESS OR IMPLIED
* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
* FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL GAMADU.COM OR
* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
* ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* 
* The views and conclusions contained in the software and documentation are those of the
* authors and should not be interpreted as representing official policies, either expressed
* or implied, of GAMADU.COM.
*/

#import "AFWorld.h"
#import "AFEntity.h"
#import "AFEntityManager.h"
#import "AFGroupManager.h"
#import "AFLabelManager.h"
#import "AFSystemManager.h"
#import "AFTagManager.h"

@interface AFWorld (Private)
- (void) notifyManagers;
- (void) notifySystems;
@end

@implementation AFWorld (Private)
- (void) notifyManagers
{

}

- (void) notifySystems
{

}
@end

@implementation AFWorld

@synthesize delta = _delta;

-(id) init
{
    if (self = [super init])
    {
		_managersByClass = [[NSMutableDictionary alloc] init];
		
        AFEntityManager*entityManager = [[[AFEntityManager alloc] initWithWorld:self] autorelease];
		[self setManager:entityManager];
		
        AFSystemManager*systemManager = [[[AFSystemManager alloc] initWithWorld:self] autorelease];
		[self setManager:systemManager];
		
        AFTagManager*tagManager = [[[AFTagManager alloc] initWithWorld:self] autorelease];
		[self setManager:tagManager];
		
        AFGroupManager*groupManager = [[[AFGroupManager alloc] initWithWorld:self] autorelease];
		[self setManager:groupManager];
		
		AFLabelManager*labelManager = [[[AFLabelManager alloc] initWithWorld:self] autorelease];
		[self setManager:labelManager];
		
        _refreshed = [[NSMutableArray alloc] init];
        _deleted = [[NSMutableArray alloc] init];

        _addedEntities = [[NSMutableArray alloc] init];
        _changedEntities = [[NSMutableArray alloc] init];
        _deletedEntities = [[NSMutableArray alloc] init];
        _enabledEntities = [[NSMutableArray alloc] init];
        _disabledEntities = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) dealloc
{
	[_managersByClass release];

    [_disabledEntities release];
    [_enabledEntities release];
    [_deletedEntities release];
    [_changedEntities release];
    [_addedEntities release];
    [_refreshed release];
    [_deleted release];
    
    [super dealloc];
}

-(void) setManager:(AFManager*)manager
{
	[_managersByClass setObject:manager forKey:(id)[manager class]];
}

-(AFManager*) getManager:(Class)managerClass
{
	return [_managersByClass objectForKey:managerClass];
}

-(AFEntityManager*)entityManager
{
	return (AFEntityManager*)[self getManager:[AFEntityManager class]];
}

-(AFSystemManager*)systemManager
{
	return (AFSystemManager*)[self getManager:[AFSystemManager class]];
}

-(void) deleteEntity:(AFEntity*)entity
{
    if (![_deleted containsObject:entity])
    {
        [_deleted addObject:entity];
    }
}

-(void) refreshEntity:(AFEntity*)entity
{
    if (![_refreshed containsObject:entity])
    {
        [_refreshed addObject:entity];
    }
}

-(AFEntity*) createEntity
{
    return [[self entityManager] createEntity];
}

-(AFEntity*) getEntity:(NSNumber *) entityId
{
    return [[self entityManager] getEntity:entityId];
}

-(void) loopStart
{
    if ([_refreshed count] > 0)
    {
		NSArray *immutableRefreshed = [NSArray arrayWithArray:_refreshed];
        for (AFEntity*entity in immutableRefreshed)
        {
            [[self entityManager] refreshEntity:entity];
			[_refreshed removeObject:entity];
        }
    }
    
    if  ([_deleted count] > 0)
    {
        for (AFEntity*entity in _deleted)
        {
            for (AFManager*manager in [_managersByClass allValues])
			{
				[manager removeEntity:entity];
			}
        }
        [_deleted removeAllObjects];
    }
}

@end
