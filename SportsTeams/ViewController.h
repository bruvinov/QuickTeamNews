//
//  ViewController.h
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/10/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "WebViewController.h"

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSDictionary *teams;

@property (nonatomic, retain) UILabel *selectLeagueLabel;
@property (nonatomic, retain) UIButton *nbaButton;
@property (nonatomic, retain) UIButton *nflButton;
@property (nonatomic, retain) UIButton *nhlButton;
@property (nonatomic, retain) UIButton *mlbButton;
@property (nonatomic, retain) UICollectionView *collectionView;

@property (nonatomic, assign) NSString  *orientation;

@property (nonatomic) NSArray *leagueSelected;

-(void)createButtons;
-(void)createCollectionView;

//-(IBAction)selectedLeague:(id)sender;


@end

