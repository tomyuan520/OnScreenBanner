static UIView* banner;
void addBanner(UIView* keyWindow){
	if (![banner isDescendantOfView:keyWindow]){
		[keyWindow addSubview:banner];
		NSLog(@"[OnScreenBanner] Added Banner");
	}
}

%ctor {
	//banner = [[UIView alloc] initWithFrame:CGRectMake(0, 265, 200, 500)];
	banner = [[UIView alloc] initWithFrame:CGRectMake(265, 0, 500, 200)];
	[banner setTag:108];
	[banner setAlpha:1];
	[banner setBackgroundColor:[UIColor blackColor]];
}

%hook UIApplication
-(void) sendEvent:(UIEvent*)event{
	%orig;
	//UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
	NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
	if ([bundleId isEqualToString:@"com.bilibili.star"]) {
		UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
		addBanner(keyWindow);
	} else if([bundleId isEqualToString:@"jp.co.craftegg.band"]){
		UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
		addBanner(keyWindow);
	}
	//addBanner(keyWindow);
}
%end