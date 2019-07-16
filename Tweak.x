/*#import <libactivator/libactivator.h>
@interface BannerActivator : NSObject <LAListener>
@end

@implementation BannerActivator

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	// do something
}


- (NSString *)activator:(LAActivator *)activator requiresLocalizedGroupForListenerName:(NSString *)listenerName {
	return @"ScreenBanner";
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName {
	return @"Show Banner";
	
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName {
	return @"Start to show a black square on the top of the screen";
}
- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName {
	return [NSArray arrayWithObjects:@"application", nil];
}
@end
*/
//static BOOL added = false;

void addBanner(UIView* keyWindow){
	//if (added) return;
	//added = true;
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 265, 200, 500)];
    [view setTag:108];
	[view setAlpha:1];
    [view setBackgroundColor:[UIColor blackColor]];
    [keyWindow addSubview:view];
}

%hook UIApplication
-(void) sendEvent:(UIEvent*)event{
	%orig;
	//if (!inApp) return;
	UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
	addBanner(keyWindow);
}
%end

