//
//  ViewController.m
//  OCESPTouch
//
//  Created by Dante on 2016/12/26.
//  Copyright © 2016年 peakhonor. All rights reserved.
//

#import "ViewController.h"
#import "ESPTouchResult.h"
#import "ESPTouchTask.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (atomic, strong) ESPTouchTask *_esptouchTask;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self._esptouchTask = [[ESPTouchTask alloc] initWithApSsid:@"WiFi"
                                                   andApBssid:@""
                                                     andApPwd:@"7788990011"
                                               andIsSsidHiden:NO];
    [self._esptouchTask setEsptouchDelegate:self];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        ESPTouchResult *result = [self._esptouchTask executeForResult];
        NSLog(@"%@", result.description);
    });
}

-(void) onEsptouchResultAddedWithResult: (ESPTouchResult *) result {
    NSLog(@"%@", result.description);
}


@end
