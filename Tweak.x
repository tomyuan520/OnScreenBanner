static UIView* banner;
void addBanner(UIView* keyWindow){
	if (![banner isDescendantOfView:keyWindow]){
		[keyWindow addSubview:banner];
		NSLog(@"[OnScreenBanner] Added Banner");
	}
}

%hook UIApplication
-(void) sendEvent:(UIEvent*)event{
	%orig;
	banner = [[UIView alloc] initWithFrame:CGRectMake(0, 265, 200, 500)];
	/*NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
	if ([bundleId isEqualToString:@"com.bilibili.star"]) {
		window = [UIApplication sharedApplication].keyWindow;
		addBanner(window);
	} else if([bundleId isEqualToString:@"jp.co.craftegg.band"]){
		window = [UIApplication sharedApplication].keyWindow;
		addBanner(window);
	}*/
	[banner setTag:108];
	[banner setAlpha:1];
	[banner setBackgroundColor:[UIColor blackColor]];
	UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
	addBanner(keyWindow);
}
%end