//
//  Cell.m
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/10/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.teamLogoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        
        [self.contentView addSubview:self.teamLogoImageView];
    }
    return self;
}

@end
