//
//  JsonObjects.h
//  Test2Ser
//
//  Created by Mircea Macovei on 03/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonObjects : NSObject

//object usually strong
@property(nonatomic) NSInteger ID;
@property(nonatomic) NSInteger SecondId;
@property(strong, nonatomic)NSString *Title;

@end
