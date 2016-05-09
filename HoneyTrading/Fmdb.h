//
//  Fmdb.h
//  HoneyTrading
//
//  Created by xxy on 16/5/9.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fmdb : NSObject

- (void *)createDB;

- (NSMutableArray *)selectDB;

- (void *)inseltDB:(NSString *)address name:(NSString *)name phone:(NSString *)phone count:(NSString *)count;

- (void *)deleteDB:(NSString *)Id;

@end
