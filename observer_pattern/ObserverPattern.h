//
//  ObserverPattern.h
//  observer_pattern
//
//  Created by Dmitriy Arkhipov on 11.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
// Push- модель обсервера, без использования Cocoa NSNotificationCenter.

#import <Foundation/Foundation.h>

#import "RandomGenerator.h"


/**
 наблюдатель, который подписывается на все уведомления наблюдаемого объекта.
 */
@protocol IObserver <NSObject>

/**
вызывается наблюдаемым объектом для уведомления наблюдателя
 */
- (void) updateObject:(id)ob;

@end

/**
 Наблюдаемый объект
 */

@protocol IObservable <NSObject>

- (void) registerObserver:(id<IObserver>)o;
- (void) removeObserver:(id<IObserver>)o;
- (void) notifyObservers;

@end

@interface StockInfo : NSObject

@property (assign, nonatomic) int USD;
@property (assign, nonatomic) int euro;

@end


@interface Stock : NSObject <IObservable>

@property (strong, nonatomic) StockInfo *sInfo; //информация о торгах

@property (strong, nonatomic) NSMutableArray *observers;

- (instancetype) init;

- (void) registerObserver:(id<IObserver>)o;

- (void) removeObserver:(id<IObserver>)o;

/**
 Вызывается метод updateObject для уведомления наблюдателей
 */
- (void) notifyObservers;

- (void) margetGeneration;

@end



@interface Broker : NSObject <IObserver>

@property (strong, nonatomic) NSString *name;

@property (weak, nonatomic) id<IObservable> stock;

- (instancetype) initWithName:(NSString *)name AndObserver:(id<IObservable>)obs;

- (void) updateObject:(id)ob;

- (void) stopTrade;

@end


@interface Bank : NSObject <IObserver>

@property (strong, nonatomic) NSString *name;

@property (weak, nonatomic) id<IObservable> stock;

- (instancetype) initWithName:(NSString *)name AndObserver:(id<IObservable>)obs;

- (void) updateObject:(id)ob;

@end





