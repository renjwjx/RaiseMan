//
//  Person.m
//  RaiseMan
//
//  Created by Adam Preble on 9/19/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init {
    self = [super init];
    if (self) {
        _expectedRaise = 0.05;
		_personName = @"New Person";
    }
    return self;
}
- (void)setNilValueForKey:(NSString *)key
{
	if ([key isEqual:@"expectedRaise"]) {
		[self setExpectedRaise:0.0];
	} else {
		[super setNilValueForKey:key];
	}
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _personName = [aDecoder decodeObjectForKey:@"personName"];
        _expectedRaise = [aDecoder decodeFloatForKey:@"expectedRaise"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_personName forKey:@"personName"];
    [aCoder encodeFloat:_expectedRaise forKey:@"expectedRaise"];
}


@end
