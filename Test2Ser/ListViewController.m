//
//  ListViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 21/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (strong, nonatomic) NSArray *arrListaDati;
@property (strong, nonatomic) NSArray *arrListDictionary;
@property (strong, nonatomic) NSDictionary *dicToSend;


//@property (strong, nonatomic) NSMutableArray *mutArrListaDati;
@end

@implementation ListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    [self setArrListaDati:@[@"Item 01",
    //                            @"Item 02",
    //                            @"Item 03",
    //                            @"Item 04",
    //                            @"Item 05",
    //                            @"Item 06",
    //                            @"Item 07",
    //                            @"Item 08",
    //                            @"Item 09",
    //                            @"Item 10",
    //                            @"Item 11",
    //                            @"Item 12",
    //                            @"Item 13",
    //                            @"Item 14",
    //                            @"Item 15",
    //                            @"Item 16",
    //                            @"Item 17",
    //                            @"Item 18",
    //                            @"Item 19",
    //                            @"Item 20",
    //                            @"Item 21"]];
    
    
    NSDictionary *dic1  = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic2  = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic3  = [NSDictionary dictionaryWithObjectsAndKeys:@"3",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic4  = [NSDictionary dictionaryWithObjectsAndKeys:@"4",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic5  = [NSDictionary dictionaryWithObjectsAndKeys:@"5",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic6  = [NSDictionary dictionaryWithObjectsAndKeys:@"6",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic7  = [NSDictionary dictionaryWithObjectsAndKeys:@"7",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic8  = [NSDictionary dictionaryWithObjectsAndKeys:@"8",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic9  = [NSDictionary dictionaryWithObjectsAndKeys:@"9",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic10 = [NSDictionary dictionaryWithObjectsAndKeys:@"10",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic11 = [NSDictionary dictionaryWithObjectsAndKeys:@"11",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic12 = [NSDictionary dictionaryWithObjectsAndKeys:@"12",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic13 = [NSDictionary dictionaryWithObjectsAndKeys:@"13",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic14 = [NSDictionary dictionaryWithObjectsAndKeys:@"14",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic15 = [NSDictionary dictionaryWithObjectsAndKeys:@"15",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic16 = [NSDictionary dictionaryWithObjectsAndKeys:@"16",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic17 = [NSDictionary dictionaryWithObjectsAndKeys:@"17",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic18 = [NSDictionary dictionaryWithObjectsAndKeys:@"18",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic19 = [NSDictionary dictionaryWithObjectsAndKeys:@"19",@"Name",[self colorWithHexString:@"ffcc00"], @"Color", nil];
    NSDictionary *dic20 = [NSDictionary dictionaryWithObjectsAndKeys:@"20",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    NSDictionary *dic21 = [NSDictionary dictionaryWithObjectsAndKeys:@"21",@"Name",[self colorWithHexString:@"58eaa1"], @"Color", nil];
    NSDictionary *dic22 = [NSDictionary dictionaryWithObjectsAndKeys:@"22",@"Name",[self colorWithHexString:@"5ac8fa"], @"Color", nil];
    
    self.arrListDictionary = @[dic1,
                               dic2,
                               dic3,
                               dic4,
                               dic5,
                               dic6,
                               dic7,
                               dic8,
                               dic9,
                               dic10,
                               dic11,
                               dic12,
                               dic13,
                               dic14,
                               dic15,
                               dic16,
                               dic17,
                               dic18,
                               dic19,
                               dic20,
                               dic21,
                               dic22];
    
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - TABLE

- (void)initTableView
{
    [_table setDataSource:self];
    [_table setDelegate:self];
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.arrListDictionary count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cella = [tableView dequeueReusableCellWithIdentifier:@"cella"];
    [cella setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *dic = self.arrListDictionary[indexPath.row];
    
    [[cella textLabel] setText:dic[@"Name"]];
    [cella setBackgroundColor:[dic objectForKey:@"Color"]];
    
    return cella;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _dicToSend = self.arrListDictionary[indexPath.row];
    
    [self performSegueWithIdentifier:@"goToDetail" sender:nil];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - SEGUE

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToDetail"]) {
        
        DetailViewController *nextVC = (DetailViewController *) [segue destinationViewController];
        [nextVC setDicElements:_dicToSend];
    }
}

#pragma mark - HEX COLOR

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
