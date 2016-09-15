//
//  ObserverPattern.m
//  observer_pattern
//
//  Created by Dmitriy Arkhipov on 11.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ObserverPattern.h"

@implementation StockInfo

@end


@implementation Stock

- (instancetype) init {
    
    self = [super init];
    
    if (self)
    {
        _observers = [[NSMutableArray alloc] init];
        _sInfo = [[StockInfo alloc] init];
    }
    
    return self;

}

- (void) registerObserver:(id<IObserver>)o {

    [_observers addObject:o];

}

- (void) removeObserver:(id<IObserver>)o {

    [_observers removeObject:o];

}

- (void) notifyObservers {
    
    for (id<IObserver> o in _observers) {
        
        [o updateObject:_sInfo];
        
    }

}

- (int) getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}


- (void) margetGeneration {

    _sInfo.USD = [RandomGenerator getRandomNumberBetween:20 to:40];
    _sInfo.euro = [RandomGenerator getRandomNumberBetween:30 to:50];
    [self notifyObservers]; 

}

@end



@implementation Broker

- (instancetype) initWithName:(NSString *)name AndObserver:(id<IObservable>)obs {
    
    self = [super init];
    
    if (self)
    {
        _name = name;
        _stock = obs;
        [_stock registerObserver:self];
    }
    
    return self;

}


- (void) updateObject:(id)ob {


    StockInfo *sInfo = ob;
    
    if (sInfo.USD > 30) {
    
        NSLog(@"Broker: Брокер %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
        
    } else {
        
        NSLog(@"Broker: Брокер %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
        
    }

}


- (void) stopTrade {

    [_stock removeObserver:self];
    _stock = nil;

}

@end


@implementation Bank

- (instancetype) initWithName:(NSString *)name AndObserver:(id<IObservable>)obs {

    self = [super init];
    
    if (self)
    {
        _name = name;
        _stock = obs;
        [_stock registerObserver:self];
    }
    
    return self;

}

- (void) updateObject:(id)ob {

    StockInfo *sInfo = ob;
    
    if (sInfo.USD > 40) {
        
        NSLog(@"Bank: Банк %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
        
    } else {
        
        NSLog(@"Bank: Банк %@ продает доллары; Курс доллара: %i ;", _name, sInfo.USD);
        
    }

}

@end











