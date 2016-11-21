//
//  LLCarGroup.h
//  LLCarsTableViewDemo
//
//  Created by Leo on 11/21/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLCar.h"

@interface LLCarGroup : NSObject
@property (copy,nonatomic) NSString *header;
@property (copy,nonatomic) NSString *footer;
@property (strong,nonatomic) NSArray *cars;
+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
@end
