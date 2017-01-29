//
//  DetailViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 21/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking.h"
#import "JsonObjects.h"
#import "CustomHeaderViewCell.h"
#import "DetailOfJsonListViewController.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) JsonObjects *jsonToSend;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_myLabel setText:[_dicElements objectForKey:@"Name"]];
    [_myLabel setBackgroundColor:[_dicElements objectForKey:@"Color"]];
    [_myLabel setTextColor:[UIColor whiteColor]];
    
    [self initTableView];
    [self getDate];
    
}

#pragma mark - Web Services

- (void)getDate
{
    // Chiamata a servizio attraverso AFNetworking
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/todos"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            
            NSMutableArray *listaJson = [NSMutableArray new];
            
            for (NSDictionary *item in responseObject) {
                
                JsonObjects *obj = [JsonObjects new];
                
                [obj setID:[[item valueForKey:@"id"] integerValue]];
                [obj setTitle:[item valueForKey:@"title"]];
                
                [listaJson addObject:obj];
            }
            
            self.arrListJson = listaJson;
            // qui faccio il reload della tabella, dopo che è stata riempita.. altrimenti la vedo sempre vuota
            [self.customTableJSON reloadData];
        }
    }];
    
    [dataTask resume];
}

#pragma mark - table

- (void)initTableView
{
    [_customTableJSON setDataSource:self];
    [_customTableJSON setDelegate:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.arrListJson count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //    qui setto number of line a zero ovvero che puo essere qualsiasi valore
    [[cell textLabel] setNumberOfLines:0];
    JsonObjects *jsonObj = _arrListJson[indexPath.row];
    [[cell textLabel] setText:[NSString stringWithFormat:@"%ld %@",(long)jsonObj.ID, jsonObj.Title]];
    
    return cell;
}

//questo delegate mi setta l'altezza automaticamente'
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
//questo delegate mi setta l'altezza Stimata automaticamente'
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    In questo caso STATIC fa si che la cella header venga caricata una sola volta e non come in questo caso 200 volte quante sono le righe
    static NSString *HeaderCellIdentifier = @"CustomHeaderViewCell";
    
    CustomHeaderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
    
    if(cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
    }
    
    [cell setBackgroundColor:[_dicElements objectForKey:@"Color"]];
    // Configure the cell title
    [cell.headerLabel setText:[_dicElements objectForKey:@"Name"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}
// quando usi heightForHeaderInSection per forza devi aggiungere anche estimatedHeightForHeaderInSection
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _jsonToSend = self.arrListJson[indexPath.row];
    
    [self performSegueWithIdentifier:@"goToJsonDetail" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"goToJsonDetail"]) {
        
        DetailOfJsonListViewController *nextVC = (DetailOfJsonListViewController *) [segue destinationViewController];
        [nextVC setJsonList:_jsonToSend];
    }
}

- (IBAction)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
