//
//  LLCar.h
//  LLCarsTableViewDemo
//
//  Created by Leo on 11/21/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCar : NSObject
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *icon;
+ (instancetype)carWithDict:(NSDictionary *)dict;
@end
