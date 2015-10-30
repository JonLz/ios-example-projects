//
//  FISScrollViewViewControllerSpec.m
//  ScrollViewAutoLayout
//
//  Created by Tom OMalley on 8/31/15.
//  Copyright 2015 Flatiron. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <KIF/KIF.h>

#import "AppDelegate.h"
#import "FISScrollViewViewController.h"

SpecBegin(FISScrollViewViewController)

describe(@"FISScrollViewViewController", ^{
    
    __block FISScrollViewViewController *scrollViewVC;
    __block UIScrollView *scrollView;
    __block NSString *scrollViewAccessLabel;
    __block UIView *contentView;
    
    
    beforeAll(^{
        UIWindow *mainWindow = ((AppDelegate*)[UIApplication sharedApplication].delegate).window;
        scrollViewVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
        [mainWindow setRootViewController: scrollViewVC];
        [mainWindow makeKeyAndVisible];
        
        scrollViewAccessLabel = @"scrollView";
        scrollView = (UIScrollView*)[tester waitForViewWithAccessibilityLabel:scrollViewAccessLabel];
        contentView = scrollView.subviews[0];
    });
    
    describe(@"basic setup", ^{
        
        describe(@"scrollView", ^{
            it(@"exists", ^{
                expect(scrollView).notTo.beNil;
            });
            
            it(@"has subviews", ^{
                expect(scrollView.subviews.count).to.beGreaterThan(0);
            });
            
            it(@"paging enabled", ^{
                expect(scrollView.pagingEnabled).to.beTruthy;
            });
        });
        
        describe(@"contentView", ^{
            
            it(@"has 5 subviews", ^{
                expect(contentView.subviews.count).to.equal(5);
            });
            
            it(@"all subviews are imageViews", ^{
                for(UIView *subview in contentView.subviews)
                {
                    expect(subview).to.beKindOf([UIImageView class]);
                }
            });
            
            it(@"all imageViews have images set", ^{
                for(UIImageView *subview in contentView.subviews)
                {
                    expect(subview.image).toNot.beNil;
                }
            });
        });
    });
    
    describe(@"scrollView", ^{
        
        __block UIImageView *firstImageView;
        __block UIImageView *secondImageView;
        __block UIImageView *thirdImageView;
        __block UIImageView *fourthImageView;
        __block UIImageView *fifthImageView;
        
        beforeAll(^{
            firstImageView = contentView.subviews[0];
            secondImageView = contentView.subviews[1];
            thirdImageView = contentView.subviews[2];
            fourthImageView = contentView.subviews[3];
            fifthImageView = contentView.subviews[4];
        });
        
        beforeEach(^{
            // resets the scrollView to original position
            [tester swipeViewWithAccessibilityLabel:scrollViewAccessLabel inDirection:KIFSwipeDirectionRight];
        });
        
        it(@"shows ONLY first image prescrolling", ^{
            
            BOOL secondIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, secondImageView.frame);
            BOOL thirdIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, thirdImageView.frame);
            BOOL fourthIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, fourthImageView.frame);
            BOOL fifthIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, fifthImageView.frame);
            
            expect(secondIVframeIntersectsSVBounds).to.beFalsy();
            expect(thirdIVframeIntersectsSVBounds).to.beFalsy();
            expect(fourthIVframeIntersectsSVBounds).to.beFalsy();
            expect(fifthIVframeIntersectsSVBounds).to.beFalsy();
        });
        
        it(@"shows first image when scrolled 0x", ^{
            
            BOOL firstIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, firstImageView.frame);
            
            expect(firstIVframeIntersectsSVBounds).to.beTruthy();
        });
        
        it(@"shows second image when scrolled 1x", ^{
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            
            BOOL secondIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, secondImageView.frame);
            
            expect(secondIVframeIntersectsSVBounds).to.beTruthy();
        });
        
        it(@"shows third image when scrolled 2x", ^{
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            
            BOOL thirdIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, thirdImageView.frame);
            
            expect(thirdIVframeIntersectsSVBounds).to.beTruthy();
        });
        
        it(@"shows fourth image when scrolled 3x", ^{
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            
            BOOL fourthIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, fourthImageView.frame);
            
            expect(fourthIVframeIntersectsSVBounds).to.beTruthy();
        });
        
        it(@"shows last image when scrolled 4x", ^{
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            [tester scrollViewWithAccessibilityIdentifier:scrollViewAccessLabel byFractionOfSizeHorizontal:(-0.2) vertical:0];
            
            BOOL fifthIVframeIntersectsSVBounds = CGRectIntersectsRect(scrollView.bounds, fifthImageView.frame);
            
            expect(fifthIVframeIntersectsSVBounds).to.beTruthy();
        });
    });
});

SpecEnd
