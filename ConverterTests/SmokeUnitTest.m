#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>


@interface SmokeUnitTest : XCTestCase

@end

@implementation SmokeUnitTest

- (void)testItShouldSmoke {
    //arrange
    NSString *foo = @"foo";
    NSString *bar = @"bar";
    //act
    //NSString *upper = [foo uppercaseString];
    NSArray *array = @[foo, bar];
    
    //assert
    
    //XCTAssert(array.count >0);
    assertThat(array, hasItem(foo));
   // XCTAssertEqualObjects(upper, @"FOO");
	//XCTAssertFalse(FALSE);
    NSInteger vier = 4;
    assertThatInteger (vier, equalToInteger(4));
}
@end
