//
//  CASBatch.h
//  Castle
//
//  Copyright © 2017 Castle. All rights reserved.
//

#import "CASModel.h"

@interface CASBatch : CASModel

@property (nonatomic, strong, readonly) NSArray *events;

+ (instancetype)batchWithEvents:(NSArray *)events;

@end
