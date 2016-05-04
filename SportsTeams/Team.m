//
//  Team.m
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/10/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import "Team.h"

@implementation Team

-(instancetype)initWithLogo:(NSString*)logo andURL:(NSString*)url{
    self = [super init];
    if (self) {
        self.logo = logo;
        self.website = url;
    }
    
    return self;
}

@end
