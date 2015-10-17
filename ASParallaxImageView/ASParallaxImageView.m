//
//  ASParallaxImageView.m
//  ParallaxImageTest1
//
//  Created by Aled Samuel on 17/10/2015.
//  Copyright © 2015 Aled Samuel. All rights reserved.
//

#import "ASParallaxImageView.h"

@implementation ASParallaxImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	// Get the specific point that was touched
	CGPoint point = [touch locationInView:self];
	//NSLog(@"X: %f.1, Y: %.1f", point.x - self.myImageView.bounds.size.width/2, point.y - self.myImageView.bounds.size.height/2);
	
	
	CGFloat newX = point.x - self.bounds.size.width/2;
	CGFloat newY = point.y - self.bounds.size.height/2;
	
	NSLog(@"X: %f.1, Y: %.1f --- newX: %.1f, newY: %.1f", newX, newY, newX/5, newY/5);
	
	if (newX < 0) {
		newY = newY * -1;
	}
	
	//CGFloat angle = (newX + newY) / 2;
	
	
	CALayer *layer = self.layer;
	CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
	rotationAndPerspectiveTransform.m34 = 1.0 / -500;
	rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform,
														  (-newX/5) * M_PI / 180.0f,	// Angle, changes on distance to centre
														  -newY/5,
														  10.0f,
														  0.0f);
	
	[UIView animateWithDuration:0.5f animations:^{
		
		layer.transform = rotationAndPerspectiveTransform;
	}];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	CALayer *layer = self.layer;
	CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
	rotationAndPerspectiveTransform.m34 = 1.0 / -500;
	rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.0f, 0.0f, 1.0f, 0.0f);
	[UIView animateWithDuration:0.5f animations:^{
		
		layer.transform = rotationAndPerspectiveTransform;
	}];
}

@end
