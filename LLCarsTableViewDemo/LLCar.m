//
//  LLCar.m
//  LLCarsTableViewDemo
//
//  Created by Leo on 11/21/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "LLCar.h"

@implementation LLCar
+ (instancetype)carWithDict:(NSDictionary *)dict {
    
    LLCar *car = [[self alloc] init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    return car;
}
@end
