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

#import "AFManager.h"

@class AFEntity;
@class AFComponent;

@interface AFEntityManager : AFManager
{
    int _nextEntityId;
    NSMutableArray *_entities;
    NSMutableDictionary *_componentsByClass;
}

@property (nonatomic, readonly) NSArray *entities;

-(AFEntity*) createEntity;
-(void) removeEntity:(AFEntity*)entity;
-(void) removeAllComponentsFromEntity:(AFEntity*)entity;
-(void) addComponent:(AFComponent*)component toEntity:(AFEntity*)entity;
-(void) refreshEntity:(AFEntity*)entity;
-(void) removeComponent:(AFComponent*)component fromEntity:(AFEntity*)entity;
-(void) removeComponentWithClass:(Class)componentClass fromEntity:(AFEntity*)entity;
-(AFComponent*) getComponentWithClass:(Class)componentClass fromEntity:(AFEntity*)entity;
-(AFEntity*) getEntity:(NSNumber *)entityId;
-(NSArray *) getComponents:(AFEntity*)entity;
-(NSMutableDictionary *) getComponentsByEntity:(Class)componentClass;

@end
