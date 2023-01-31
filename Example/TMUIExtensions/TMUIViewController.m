//
//  TMUIViewController.m
//  TMUIExtensions
//
//  Created by Joe.cheng on 01/16/2023.
//  Copyright (c) 2023 Joe.cheng. All rights reserved.
//

#import "TMUIViewController.h"
#import <TMUICore/TMUICore.h>

@interface TMUIViewController ()

@end

@implementation TMUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    classref_t *classes = nil;
    int count = tmui_getProjectClassList(&classes);
    for (int i = 0; i < count; i++) {
        Class class = (__bridge Class)classes[i];
        NSLog(@"%@",NSStringFromClass(class));
    }
    
    NSLog(@"finish");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
