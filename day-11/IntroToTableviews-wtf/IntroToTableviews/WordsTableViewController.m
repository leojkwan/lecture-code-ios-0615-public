//
//  WordsTableViewController.m
//  IntroToTableviews
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "WordsTableViewController.h"
#import "Definition.h"

@interface WordsTableViewController ()

@property (nonatomic, strong) NSArray *interestingWords;

@end

@implementation WordsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interestingWords =
    @[ [Definition definitionWithWord:@"agastopia" meaning:@"admiration of a particular part of someone’s body"],
       [Definition definitionWithWord:@"bibble" meaning:@"to drink often; to eat and/or drink noisily"],
       [Definition definitionWithWord:@"cabotage" meaning:@"coastal navigation; the exclusive right of a country to control the air traffic within its borders"],
       [Definition definitionWithWord:@"doodlesack" meaning:@"old English word for bagpipe"],
       [Definition definitionWithWord:@"erinaceous" meaning:@"of, pertaining to, or resembling a hedgehog"],
       [Definition definitionWithWord:@"firman" meaning:@"a decree or mandate issued by the sovereign (esp. in Turkey)"],
       [Definition definitionWithWord:@"gabelle" meaning:@"a tax on salt"],
       [Definition definitionWithWord:@"halfpace" meaning:@"a platform of a staircase where the stair turns back in exactly the reverse direction of the lower flight"],
       [Definition definitionWithWord:@"impignorate" meaning:@"to pawn or mortgage something"],
       [Definition definitionWithWord:@"jentacular" meaning:@"pertaining to breakfast"],
       [Definition definitionWithWord:@"kakorrhaphiophobia" meaning:@"fear of failure"],
       [Definition definitionWithWord:@"lamprophony" meaning:@"loudness and clarity of enunciation"],
       [Definition definitionWithWord:@"macrosmatic" meaning:@"having a good sense of smell"],
       [Definition definitionWithWord:@"nudiustertian" meaning:@"the day before yesterday"],
       [Definition definitionWithWord:@"oxter" meaning:@"outdated word meaning “armpit”"],
       [Definition definitionWithWord:@"pauciloquent" meaning:@"uttering few words; brief in speech"],
       [Definition definitionWithWord:@"quire" meaning:@"two dozen sheets of paper"],
       [Definition definitionWithWord:@"ratoon" meaning:@"small shoot growing from the root of a plant"],
       [Definition definitionWithWord:@"salopettes" meaning:@"high-waisted skiing pants with shoulder straps"],
       [Definition definitionWithWord:@"ulotrichous" meaning:@"having wooly or crispy hair"],
       [Definition definitionWithWord:@"valetudinarian" meaning:@"a sickly or weak person, especially one who is constantly and morbidly concerned with his or her health"],
       [Definition definitionWithWord:@"winklepicker" meaning:@"style of shoe or boot in the 1950s with a sharp and long pointed toe"],
       [Definition definitionWithWord:@"xertz" meaning:@"to gulp down quickly and greedily"],
       [Definition definitionWithWord:@"yarborough" meaning:@"hand of cards containing no card above a nine"],
       [Definition definitionWithWord:@"zoanthropy" meaning:@"delusion of a person who believes himself changed into an animal"] ];

    for(NSUInteger i = 0; i < 5; i++) {
        self.interestingWords = [self.interestingWords arrayByAddingObjectsFromArray:self.interestingWords];
    }


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshControlActivated:(id)sender
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.refreshControl endRefreshing];
    });
}

-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you tapped the word %@", self.interestingWords[indexPath.row]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.interestingWords.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section %lu, row %lu", indexPath.section, indexPath.row);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WordCellReuseID" forIndexPath:indexPath];

    NSUInteger cellRow = indexPath.row;
    Definition *wordForThisRow = self.interestingWords[cellRow];

    cell.textLabel.text = wordForThisRow.word;
    cell.detailTextLabel.text = wordForThisRow.definition;
    
    return cell;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
