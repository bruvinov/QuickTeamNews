//
//  ViewController.m
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/10/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController


/*===================================OBJECT CREATION===================================*/

-(void)createButtons {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    //CGFloat screenHeight = screenRect.size.height;
    CGFloat four = 4;
    
    CGFloat leagueButtonWidth = screenWidth/four;
    CGFloat leagueButtonHeight = 35;
    
    //NBA BUTTON
    UIColor *nbaColor = [UIColor colorWithRed: 191.0/255.0 green: 119.0/255.0 blue:64.0/255.0 alpha: 1.0];
    self.nbaButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, leagueButtonWidth, leagueButtonHeight)];
    self.nbaButton.backgroundColor = nbaColor;
    [self.nbaButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nbaButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:17]];
    self.nbaButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nbaButton setTitle:@"NBA" forState:UIControlStateNormal];
    
    [self.nbaButton addTarget:self action:@selector(selectedLeague:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nbaButton];
    
    //NFL BUTTON
    UIColor *nflColor = [UIColor colorWithRed: 73.0/255.0 green: 43.0/255.0 blue:24/255.0 alpha: 1.0];
    self.nflButton = [[UIButton alloc]initWithFrame:CGRectMake(leagueButtonWidth, 20, leagueButtonWidth, leagueButtonHeight)];
    self.nflButton.backgroundColor = nflColor;
    [self.nflButton setTitle:@"NFL" forState:UIControlStateNormal];
    [self.nflButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nflButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:17]];
    self.nflButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.nflButton addTarget:self action:@selector(selectedLeague:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nflButton];

    //NHL BUTTON
    UIColor *nhlColor = [UIColor colorWithRed: 52.0/255.0 green: 120.0/255.0 blue:157.0/255.0 alpha: 1.0];
    self.nhlButton = [[UIButton alloc]initWithFrame:CGRectMake(leagueButtonWidth * 2, 20, leagueButtonWidth, leagueButtonHeight)];
    self.nhlButton.backgroundColor = nhlColor;
    [self.nhlButton setTitle:@"NHL" forState:UIControlStateNormal];
    [self.nhlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nhlButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:17]];
    self.nhlButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.nhlButton addTarget:self action:@selector(selectedLeague:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nhlButton];

    //MLB BUTTON
    
    UIColor *mlbColor = [UIColor colorWithRed: 33.0/255.0 green: 80.0/255.0 blue:27.0/255.0 alpha: 1.0];
    self.mlbButton = [[UIButton alloc]initWithFrame:CGRectMake(leagueButtonWidth * 3, 20, leagueButtonWidth, leagueButtonHeight)];
    self.mlbButton.backgroundColor = mlbColor;
    [self.mlbButton setTitle:@"MLB" forState:UIControlStateNormal];
    [self.mlbButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.mlbButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:17]];
    self.mlbButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.mlbButton addTarget:self action:@selector(selectedLeague:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mlbButton];
}

-(void)createCollectionView {
    //BOUNDS OF SCREEN
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //CREATE AND CUSTOMIZE COLLECTION VIEW LAYOUT
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(screenWidth/5, screenWidth/5)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //INIT COLLECTION VIEW OBJECT
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 60, screenWidth-40, screenHeight-75) collectionViewLayout:layout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    self.collectionView.alwaysBounceVertical = YES;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
}

-(void)loadLabel {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat two = 2;
    
    self.selectLeagueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, screenHeight/two, screenWidth, 40)];
    self.selectLeagueLabel.text = @"select one of the above leagues to get started";
    self.selectLeagueLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    self.selectLeagueLabel.textAlignment = NSTextAlignmentCenter;
    
    self.selectLeagueLabel.hidden = NO;
    [self.view addSubview:self.selectLeagueLabel];
}

/*===================================ACTIONS===================================*/


-(IBAction)selectedLeague:(id)sender {
    UIButton *senderButton = sender;
    self.view.backgroundColor = senderButton.backgroundColor;
    self.collectionView.backgroundColor = senderButton.backgroundColor;
    self.selectLeagueLabel.hidden = YES;
    if ([sender isEqual:self.nbaButton]) {
        self.leagueSelected = [[NSArray alloc]initWithArray:[self.teams objectForKey:@"NBA"]];
        [self.collectionView reloadData];
    } else if ([sender isEqual:self.nflButton]) {
        self.leagueSelected = [[NSArray alloc]initWithArray:[self.teams objectForKey:@"NFL"]];
        [self.collectionView reloadData];
    } else if ([sender isEqual:self.nhlButton]) {
        self.leagueSelected = [[NSArray alloc]initWithArray:[self.teams objectForKey:@"NHL"]];
        [self.collectionView reloadData];
    } else if ([sender isEqual:self.mlbButton]) {
        self.leagueSelected = [[NSArray alloc]initWithArray:[self.teams objectForKey:@"MLB"]];
        [self.collectionView reloadData];
    }
}


/*=========================COLLECTION VIEW DELEGATE AND DATA SOURCE=========================*/


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.leagueSelected.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.teamLogoImageView.image = [UIImage imageNamed:[self.leagueSelected[indexPath.row] logo]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WebViewController *teamWebsite = [[WebViewController alloc]init];
    teamWebsite.url = [NSString stringWithString:[self.leagueSelected[indexPath.row] website]];
    teamWebsite.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:teamWebsite animated:YES completion:nil];
}

/*===================================DATA CREATION===================================*/

-(void)createTeams {
    Team *hawks = [[Team alloc]initWithLogo:@"atlantahawks.png" andURL:@"www.nba.com/hawks"];
    Team *celtics = [[Team alloc]initWithLogo:@"celtics.png" andURL:@"www.nba.com/celtics"];
    Team *nets = [[Team alloc]initWithLogo:@"nets.png" andURL:@"www.nba.com/nets"];
    Team *hornets = [[Team alloc]initWithLogo:@"hornets.png" andURL:@"www.nba.com/hornets"];
    Team *bulls = [[Team alloc]initWithLogo:@"bulls.png" andURL:@"www.nba.com/bulls"];
    Team *cavaliers = [[Team alloc]initWithLogo:@"cavs.png" andURL:@"www.nba.com/cavaliers"];
    Team *mavericks = [[Team alloc]initWithLogo:@"mavs.png" andURL:@"www.nba.com/mavericks"];
    Team *nuggets = [[Team alloc]initWithLogo:@"nuggets.png" andURL:@"www.nba.com/nuggets"];
    Team *pistons = [[Team alloc]initWithLogo:@"pistons.png" andURL:@"www.nba.com/pistons"];
    Team *warriors = [[Team alloc]initWithLogo:@"warriors.png" andURL:@"www.nba.com/warriors"];
    Team *rockets = [[Team alloc]initWithLogo:@"rockets.png" andURL:@"www.nba.com/rockets"];
    Team *pacers = [[Team alloc]initWithLogo:@"pacers.png" andURL:@"www.nba.com/pacers"];
    Team *clippers = [[Team alloc]initWithLogo:@"clippers.png" andURL:@"www.nba.com/clippers"];
    Team *lakers = [[Team alloc]initWithLogo:@"lakers.png" andURL:@"www.nba.com/lakers"];
    Team *grizzlies = [[Team alloc]initWithLogo:@"grizzlies.png" andURL:@"www.nba.com/grizzlies"];
    Team *heat = [[Team alloc]initWithLogo:@"heat.png" andURL:@"www.nba.com/heat"];
    Team *bucks = [[Team alloc]initWithLogo:@"bucks.png" andURL:@"www.nba.com/bucks"];
    Team *timberwolves = [[Team alloc]initWithLogo:@"timbs.png" andURL:@"www.nba.com/timberwolves"];
    Team *pelicans = [[Team alloc]initWithLogo:@"pelicans.png" andURL:@"www.nba.com/pelicans"];
    Team *knicks = [[Team alloc]initWithLogo:@"knicks.png" andURL:@"www.nba.com/knicks"];
    Team *thunder = [[Team alloc]initWithLogo:@"thunder.png" andURL:@"www.nba.com/thunder"];
    Team *magic = [[Team alloc]initWithLogo:@"magic.png" andURL:@"www.nba.com/magic"];
    Team *phi76ers = [[Team alloc]initWithLogo:@"76ers.png" andURL:@"www.nba.com/sixers"];
    Team *suns = [[Team alloc]initWithLogo:@"suns.png" andURL:@"www.nba.com/suns"];
    Team *trailblazers = [[Team alloc]initWithLogo:@"blazers.png" andURL:@"www.nba.com/blazers"];
    Team *sacKings = [[Team alloc]initWithLogo:@"sackings.png" andURL:@"www.nba.com/kings"];
    Team *spurs = [[Team alloc]initWithLogo:@"spurs.png" andURL:@"www.nba.com/spurs"];
    Team *raptors = [[Team alloc]initWithLogo:@"raptors.png" andURL:@"www.nba.com/raptors"];
    Team *jazz = [[Team alloc]initWithLogo:@"jazz.png" andURL:@"www.nba.com/jazz"];
    Team *wizards = [[Team alloc]initWithLogo:@"wizards.png" andURL:@"www.nba.com/wizards"];
    
    NSArray *nbaTeams = @[hawks, celtics, nets, hornets, bulls, cavaliers, mavericks, nuggets, pistons, warriors, rockets, pacers, clippers, lakers, grizzlies, heat, bucks, timberwolves, pelicans, knicks, thunder, magic, phi76ers, suns, trailblazers, sacKings, spurs, raptors, jazz, wizards];
    
    Team *cardinals = [[Team alloc]initWithLogo:@"cardinals.png" andURL:@"www.azcardinals.com/"];
    Team *falcons = [[Team alloc]initWithLogo:@"falcons.png" andURL:@"www.atlantafalcons.com"];
    Team *ravens = [[Team alloc]initWithLogo:@"ravens.png" andURL:@"www.baltimoreravens.com/"];
    Team *bills = [[Team alloc]initWithLogo:@"bills.png" andURL:@"www.buffalobills.com/"];
    Team *panthers = [[Team alloc]initWithLogo:@"panthers.png" andURL:@"www.panthers.com/"];
    Team *bears = [[Team alloc]initWithLogo:@"bears.png" andURL:@"www.chicagobears.com"];
    Team *bengals = [[Team alloc]initWithLogo:@"bengals.png" andURL:@"www.bengals.com"];
    Team *browns = [[Team alloc]initWithLogo:@"browns.png" andURL:@"www.clevelandbrowns.com"];
    Team *cowboys = [[Team alloc]initWithLogo:@"cowboys.png" andURL:@"www.dallascowboys.com"];
    Team *broncos = [[Team alloc]initWithLogo:@"broncos.png" andURL:@"www.denverbroncos.com/"];
    Team *lions = [[Team alloc]initWithLogo:@"lions.png" andURL:@"www.detroitlions.com/"];
    Team *packers = [[Team alloc]initWithLogo:@"packers.png" andURL:@"www.packers.com/"];
    Team *texans = [[Team alloc]initWithLogo:@"texans.png" andURL:@"www.houstontexans.com"];
    Team *colts = [[Team alloc]initWithLogo:@"colts.png" andURL:@"www.colts.com/"];
    Team *jaguars = [[Team alloc]initWithLogo:@"jags.png" andURL:@"www.jaguars.com/"];
    Team *chiefs = [[Team alloc]initWithLogo:@"chiefs.png" andURL:@"www.chiefs.com"];
    Team *rams = [[Team alloc]initWithLogo:@"rams.png" andURL:@"www.therams.com"];
    Team *dolphins = [[Team alloc]initWithLogo:@"dolphins.png" andURL:@"www.miamidolphins.com/"];
    Team *vikings = [[Team alloc]initWithLogo:@"vikings.png" andURL:@"www.vikings.com"];
    Team *patriots = [[Team alloc]initWithLogo:@"patriots.png" andURL:@"www.patriots.com/"];
    Team *saints = [[Team alloc]initWithLogo:@"saints.png" andURL:@"www.neworleanssaints.com/"];
    Team *giants = [[Team alloc]initWithLogo:@"nyg.png" andURL:@"www.giants.com/"];
    Team *jets = [[Team alloc]initWithLogo:@"nyj.png" andURL:@"www.newyorkjets.com"];
    Team *raiders = [[Team alloc]initWithLogo:@"raiders.png" andURL:@"www.raiders.com/"];
    Team *eagles = [[Team alloc]initWithLogo:@"eagles.png" andURL:@"www.philadelphiaeagles.com"];
    Team *steelers = [[Team alloc]initWithLogo:@"steelers.png" andURL:@"www.steelers.com/"];
    Team *chargers = [[Team alloc]initWithLogo:@"chargers.png" andURL:@"www.chargers.com"];
    Team *sf49ers = [[Team alloc]initWithLogo:@"49ers.png" andURL:@"www.49ers.com"];
    Team *seahawks = [[Team alloc]initWithLogo:@"seahawks.png" andURL:@"www.seahawks.com"];
    Team *bucs = [[Team alloc]initWithLogo:@"bucs.png" andURL:@"www.buccaneers.com"];
    Team *titans = [[Team alloc]initWithLogo:@"titans.png" andURL:@"www.titansonline.com"];
    Team *redskins = [[Team alloc]initWithLogo:@"redskins.png" andURL:@"www.redskins.com/"];
    
    NSArray *nflTeams = @[cardinals, falcons, ravens, bills, panthers, bears, bengals, browns, broncos, cowboys, lions, packers, texans, colts, jaguars, chiefs, rams, dolphins, vikings, patriots, saints, giants, jets, raiders, eagles, steelers, chargers, sf49ers, seahawks, bucs, titans, redskins];
    
    Team *ducks = [[Team alloc]initWithLogo:@"ducks.png" andURL:@"ducks.nhl.com"];
    Team *coyotes = [[Team alloc]initWithLogo:@"coyotes.png" andURL:@"coyotes.nhl.com"];
    Team *bruins = [[Team alloc]initWithLogo:@"bruins.png" andURL:@"bruins.nhl.com"];
    Team *sabres = [[Team alloc]initWithLogo:@"sabres.png" andURL:@"sabres.nhl.com"];
    Team *flames = [[Team alloc]initWithLogo:@"flames.png" andURL:@"flames.nhl.com"];
    Team *hurricanes = [[Team alloc]initWithLogo:@"hurricanes.png" andURL:@"hurricanes.nhl.com"];
    Team *blackhawks = [[Team alloc]initWithLogo:@"blackhawks.png" andURL:@"blackhawks.nhl.com"];
    Team *avalanche = [[Team alloc]initWithLogo:@"avs.png" andURL:@"avalanche.nhl.com"];
    Team *blueJackets = [[Team alloc]initWithLogo:@"jackets.png" andURL:@"bluejackets.nhl.com"];
    Team *stars = [[Team alloc]initWithLogo:@"stars.png" andURL:@"stars.nhl.com"];
    Team *redWings = [[Team alloc]initWithLogo:@"redwings.png" andURL:@"redwings.nhl.com"];
    Team *oilers = [[Team alloc]initWithLogo:@"oilers.png" andURL:@"oilers.nhl.com"];
    Team *flPanthers = [[Team alloc]initWithLogo:@"flpanthers.png" andURL:@"panthers.nhl.com"];
    Team *kings = [[Team alloc]initWithLogo:@"lakings.png" andURL:@"kings.nhl.com"];
    Team *wild = [[Team alloc]initWithLogo:@"wild.png" andURL:@"wild.nhl.com"];
    Team *canadians = [[Team alloc]initWithLogo:@"habs.png" andURL:@"canadiens.nhl.com"];
    Team *predators = [[Team alloc]initWithLogo:@"predators.png" andURL:@"predators.nhl.com"];
    Team *devils = [[Team alloc]initWithLogo:@"devils.png" andURL:@"devils.nhl.com"];
    Team *islanders = [[Team alloc]initWithLogo:@"nyi.png" andURL:@"www.newyorkislanders.com"];
    Team *rangers = [[Team alloc]initWithLogo:@"nyr.png" andURL:@"www.newyorkrangers.com/"];
    Team *senators = [[Team alloc]initWithLogo:@"sens.png" andURL:@"senators.nhl.com"];
    Team *flyers = [[Team alloc]initWithLogo:@"flyers.png" andURL:@"www.philadelphiaflyers.com"];
    Team *penguins = [[Team alloc]initWithLogo:@"pens.png" andURL:@"www.pittsburghpenguins.com"];
    Team *sharks = [[Team alloc]initWithLogo:@"sharks.png" andURL:@"sharks.nhl.com"];
    Team *lightning = [[Team alloc]initWithLogo:@"lightning.png" andURL:@"lightning.nhl.com"];
    Team *mapleLeafs = [[Team alloc]initWithLogo:@"mapleleafs.png" andURL:@"maplesleafs.nhl.com"];
    Team *canucks = [[Team alloc]initWithLogo:@"canucks.png" andURL:@"canucks.nhl.com"];
    Team *capitals = [[Team alloc]initWithLogo:@"caps.gif" andURL:@"capitals.nhl.com"];
    Team *winnJets = [[Team alloc]initWithLogo:@"jets.png" andURL:@"jets.nhl.com"];
    
    NSArray *nhlTeams = @[ducks, coyotes, bruins, sabres, flames, hurricanes, blackhawks, avalanche, blueJackets, stars, redWings, oilers, flPanthers, kings, wild, canadians, predators, devils, islanders, rangers, senators, flyers, penguins, sharks, lightning, mapleLeafs, canucks, capitals, winnJets];
    
    Team *diamondbacks = [[Team alloc]initWithLogo:@"dbacks.png" andURL:@"dbacks.com"];
    Team *braves = [[Team alloc]initWithLogo:@"ATL.png" andURL:@"braves.com"];
    Team *orioles = [[Team alloc]initWithLogo:@"orioles.png" andURL:@"orioles.com"];
    Team *redSox = [[Team alloc]initWithLogo:@"redsox.png" andURL:@"redsox.com"];
    Team *cubs = [[Team alloc]initWithLogo:@"cubs.png" andURL:@"cubs.com"];
    Team *whiteSox = [[Team alloc]initWithLogo:@"whitesox.png" andURL:@"whitesox.com"];
    Team *reds = [[Team alloc]initWithLogo:@"reds.png" andURL:@"reds.com"];
    Team *indians = [[Team alloc]initWithLogo:@"indians.gif" andURL:@"indians.com"];
    Team *rockies = [[Team alloc]initWithLogo:@"rockies.png" andURL:@"rockies.com"];
    Team *tigers = [[Team alloc]initWithLogo:@"tigers.png" andURL:@"tigers.com"];
    Team *marlins = [[Team alloc]initWithLogo:@"marlins.png" andURL:@"www.marlins.com/"];
    Team *astros = [[Team alloc]initWithLogo:@"astros.png" andURL:@"astros.com"];
    Team *royals = [[Team alloc]initWithLogo:@"royals.png" andURL:@"royals.com"];
    Team *angels = [[Team alloc]initWithLogo:@"angels" andURL:@"angels.com"];
    Team *dodgers = [[Team alloc]initWithLogo:@"dodgers" andURL:@"dodgers.com"];
    Team *brewers = [[Team alloc]initWithLogo:@"brewers" andURL:@"brewers.com"];
    Team *twins = [[Team alloc]initWithLogo:@"twins" andURL:@"twinsbaseball.com"];
    Team *mets = [[Team alloc]initWithLogo:@"nym" andURL:@"mets.com"];
    Team *yankees = [[Team alloc]initWithLogo:@"nyy" andURL:@"yankees.com"];
    Team *athletics = [[Team alloc]initWithLogo:@"athletics" andURL:@"athletics.com"];
    Team *phillies = [[Team alloc]initWithLogo:@"phillies" andURL:@"www.phillies.com"];
    Team *pirates = [[Team alloc]initWithLogo:@"pirates" andURL:@"www.pirates.com/"];
    Team *padres = [[Team alloc]initWithLogo:@"padres" andURL:@"padres.com"];
    Team *sfGiants = [[Team alloc]initWithLogo:@"sfgiants" andURL:@"sfgiants.com"];
    Team *mariners = [[Team alloc]initWithLogo:@"mariners" andURL:@"mariners.com"];
    Team *stlCardinals = [[Team alloc]initWithLogo:@"stlcardinals" andURL:@"cardinals.com"];
    Team *rays = [[Team alloc]initWithLogo:@"rays" andURL:@"raysbaseball.com"];
    Team *texRangers = [[Team alloc]initWithLogo:@"rangers" andURL:@"texasrangers.com"];
    Team *blueJays = [[Team alloc]initWithLogo:@"jays" andURL:@"bluejays.com"];
    Team *nationals = [[Team alloc]initWithLogo:@"nationals" andURL:@"www.nationals.com/"];
    
    NSArray *mlbTeams = @[diamondbacks, braves, orioles, redSox, cubs, whiteSox, reds, indians, rockies, tigers, marlins, astros, royals, angels, dodgers, brewers, twins, mets, yankees, athletics, phillies, pirates, padres, sfGiants, mariners, stlCardinals, rays, texRangers, blueJays, nationals];
    
    self.teams = @{@"NBA":nbaTeams,
                   @"NFL":nflTeams,
                   @"NHL":nhlTeams,
                   @"MLB":mlbTeams};

}

- (void)readjustViews {
    if (self.leagueSelected) {
        [self.nbaButton removeFromSuperview];
        self.nbaButton= nil;
        [self.nflButton removeFromSuperview];
        self.nflButton = nil;
        [self.nhlButton removeFromSuperview];
        self.nhlButton = nil;
        [self.mlbButton removeFromSuperview];
        self.mlbButton = nil;
        
        [self createButtons];
        
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.collectionView.frame= CGRectMake(20, 60, screenWidth-40, screenHeight);
        
        [self.collectionView reloadData];
    }
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self readjustViews];
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *currentOrientation;
    BOOL didChangeOrientation;
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight){
        currentOrientation = @"landscape";
    }
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown ) {
        currentOrientation = @"portrait";
    }
    
    if (![currentOrientation isEqualToString:self.orientation]) {
        didChangeOrientation = YES;
    } else {
        didChangeOrientation = NO;
    }
    
    if (didChangeOrientation) {
        [self readjustViews];
    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight) {
        self.orientation = @"landscape";
    }
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown ) {
        self.orientation = @"portrait";
    }
    
    [self createTeams];
    [self createButtons];
    [self createCollectionView];

    
    [self loadLabel];
    
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"CELL"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
