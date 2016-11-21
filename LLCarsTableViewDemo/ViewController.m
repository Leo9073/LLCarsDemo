//
//  ViewController.m
//  LLCarsTableViewDemo
//
//  Created by Leo on 11/21/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LLCarGroup.h"
#import <MJExtension.h>

static NSString *cellID = @"cellID";

@interface ViewController () <UITableViewDataSource>
@property (strong,nonatomic) NSArray *carGroupArray;
@end

@implementation ViewController


- (NSArray *)carGroupArray {
    
    if (!_carGroupArray) {
        //加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
       //将字典数组转为模型数组
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *carGroupDict in dictArray) {
            LLCarGroup *carGroup = [LLCarGroup carGroupWithDict:carGroupDict];
            [temp addObject:carGroup];
        }
        _carGroupArray = temp;
    }
    return _carGroupArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.carGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    LLCarGroup *carGroup = self.carGroupArray[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    LLCarGroup *carGroup = self.carGroupArray[indexPath.section];
    LLCar *car = carGroup.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    LLCarGroup *carGroup = self.carGroupArray[section];
    return carGroup.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    LLCarGroup *carGroup = self.carGroupArray[section];
    return carGroup.footer;
}

@end
