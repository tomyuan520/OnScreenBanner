static UIView* banner;
void addBanner(UIView* keyWindow){
	if (![banner isDescendantOfView:keyWindow]){
		[keyWindow addSubview:banner];
		NSLog(@"[OnScreenBanner] Added Banner");
	}
}

%ctor {
	banner = [[UIView alloc] initWithFrame:CGRectMake(0, 265, 200, 500)];
	[banner setTag:108];
	[banner setAlpha:1];
	[banner setBackgroundColor:[UIColor blackColor]];
}

%hook UIApplication
-(void) sendEvent:(UIEvent*)event{
	%orig;
	/*NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
	if ([bundleId isEqualToString:@"com.bilibili.star"]) {
		window = [UIApplication sharedApplication].keyWindow;
		addBanner(window);
	} else if([bundleId isEqualToString:@"jp.co.craftegg.band"]){
		window = [UIApplication sharedApplication].keyWindow;
		addBanner(window);
	}*/
	UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
	addBanner(keyWindow);
}
%end