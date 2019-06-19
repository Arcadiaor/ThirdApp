//
//  LYMenuView.h
//  SecondApp
//
//  Created by leiyong on 2019/5/15.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MenuButtonCallBackBlock)(NSInteger index,NSString *title,NSInteger titleCounts);


@interface LYMenuView : UIView
/**
 *  Convenient init method
 *
 *  @param titles Your menu options
 *
 *  @return object
 */

-(id)initWithTitles:(NSArray *)titles;


/**
 *  Custom init method
 *
 *  @param titles Your menu options
 *
 *  @return object
 */
-(id)initWithTitles:(NSArray *)titles withButtonHeight:(CGFloat)height withMenuColor:(UIColor *)menuColor withBackBlurStyle:(UIBlurEffectStyle)style;


/**
 *  Method to trigger the animation
 */
-(void)trigger;




/**
 *  The height of the menu height
 */
@property(nonatomic,assign)CGFloat menuButtonHeight;


/**
 *  The block of menu buttons cliced call back
 */
@property(nonatomic,copy)MenuButtonCallBackBlock menuClickBlock;





@end

NS_ASSUME_NONNULL_END
