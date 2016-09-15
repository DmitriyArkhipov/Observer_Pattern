//
//  ViewController.m
//  observer_pattern
//
//  Created by Dmitriy Arkhipov on 11.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"

#import "ObserverPattern.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Stock *stock = [[Stock alloc] init];
    
    Bank *bank = [[Bank alloc] initWithName:@"СБЕРБАНК" AndObserver:stock];
    Broker *broker = [[Broker alloc] initWithName:@"Петр Петрович" AndObserver:stock];
    
    //имитация торгов
    [stock margetGeneration];
    
    //брокер прекращает наблюдать за торгами
    [broker stopTrade];
    
    //имитация торгов
    [stock margetGeneration];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
