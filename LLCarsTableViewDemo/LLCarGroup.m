//
//  LLCarGroup.m
//  LLCarsTableViewDemo
//
//  Created by Leo on 11/21/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "LLCarGroup.h"
#import "LLCar.h"

@implementation LLCarGroup
+ (instancetype)carGroupWithDict:(NSDictionary *)dict {
    
    LLCarGroup *carGroup = [[self alloc] init];
    carGroup.header = dict[@"header"];
    carGroup.footer = dict[@"footer"];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        LLCar *car = [LLCar carWithDict:carDict];
        [temp addObject:car];
    }
    carGroup.cars = temp;
    return carGroup;
}
@end
