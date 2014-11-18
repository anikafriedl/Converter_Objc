//
//  converterControllerTest.m
//  Converter
//
//  Created by Anika Friedl on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface ConverterController (Testing)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
//@property (nonatomic, weak) IBOutlet UILabel *currencyLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface converterControllerTest : XCTestCase

@end

@implementation converterControllerTest
{
    ConverterController *controller;
    UILabel *displayLabel;
}

- (void)setUp{
    controller = [[ConverterController alloc] init];
    
    displayLabel = [[UILabel alloc] init];
    controller.displayLabel = displayLabel;
    [controller view];
}

- (UIButton *)buttonWithTag:(NSInteger)tag{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    return button;
}

- (void)testZahlButtonErscheintInDisplay {
    [controller buttonTouched:[self buttonWithTag:1]];
    assertThat(displayLabel.text, is(@"1"));
}

- (void)testEingabeGanzeZahl {
    [controller buttonTouched:[self buttonWithTag:1]];
    [controller buttonTouched:[self buttonWithTag:2]];
    assertThat(displayLabel.text, is(@"12"));
}

- (void)testLaengeZehn {
    controller.displayLabel.text = @"1234567890";
    [controller buttonTouched:[self buttonWithTag:1]];
    assertThat(displayLabel.text, is(@"1234567890"));
}

- (void)testdoppelNull {
    [controller buttonTouched:[self buttonWithTag:0]];
    [controller buttonTouched:[self buttonWithTag:0]];
    assertThat(displayLabel.text, is(@"0"));
}

- (void)testKomma {
    controller.displayLabel.text = @"1";
    [controller buttonTouched:[self buttonWithTag:10]];
    [controller buttonTouched:[self buttonWithTag:2]];
    [controller buttonTouched:[self buttonWithTag:10]];
    [controller buttonTouched:[self buttonWithTag:3]];
    assertThat(displayLabel.text, is(@"1,23"));
}







@end
