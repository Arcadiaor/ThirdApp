//
//  LYMenuButton.h
//  SecondApp
//
//  Created by leiyong on 2019/5/15.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYMenuButton : UIView


/**
 *  onvenient init method
 *
 *  @param title title
 *
 *  @return object
 */
-(id)initWithTitle:(NSString *)title;


/**
 *  The button color
 */
@property(nonatomic,strong)UIColor *buttonColor;



/**
 *  button clicked block
 */
@property(nonatomic,copy)void(^buttonClickBlock)(void);

@property (nonatomic,assign)CGFloat titleFontSize;


@end

NS_ASSUME_NONNULL_END
