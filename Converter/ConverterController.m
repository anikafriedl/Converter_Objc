#import "ConverterController.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (nonatomic) BOOL komma;
@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
    self.komma = false;
}

- (IBAction)buttonTouched:(id)sender {
    if (self.displayLabel.text.length <10) {
        if ((long)[sender tag] == 10) {
            if (!self.komma) {
                self.displayLabel.text = [NSString stringWithFormat:@"%@,", self.displayLabel.text];
                self.komma = true;
            }
            
        }
        else if ([self.displayLabel.text isEqualToString:@"0"]) {
            self.displayLabel.text = [NSString stringWithFormat:@"%ld",(long)[sender tag]];
        }
        else
        {
            self.displayLabel.text = [NSString stringWithFormat:@"%@%ld", self.displayLabel.text,(long)[sender tag]];
        }
    }
    
}


@end
