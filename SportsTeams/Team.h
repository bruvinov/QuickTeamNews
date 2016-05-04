//
//  Team.h
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/10/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSString *website;

-(instancetype)initWithLogo:(NSString*)logo andURL:(NSString*)url;


@end
