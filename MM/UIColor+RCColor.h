
#import <UIKit/UIKit.h>

@interface UIColor (RCColor)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

//UIColor 转UIImage
+ (UIImage*) imageWithColor: (UIColor*) color;

@end
