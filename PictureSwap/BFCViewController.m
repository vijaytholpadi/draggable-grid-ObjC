//
//  BFCViewController.m
//  PictureSwap
//
//  Created by Vijay Tholpadi on 20/09/14.
//  Copyright (c) 2014 TheGeekProjekt. All rights reserved.
//

#import "BFCViewController.h"

@interface BFCViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;
@property (weak, nonatomic) IBOutlet UIImageView *imageView6;
@property (nonatomic, strong) NSMutableArray *ImageViewsArray;
@property (nonatomic, strong) NSMutableArray *ImageViewsFramesArray;

@property(nonatomic, assign) CGRect frame1;
@property(nonatomic, assign) CGRect frame2;
@property(nonatomic, assign) CGRect frame3;
@property(nonatomic, assign) CGRect frame4;
@property(nonatomic, assign) CGRect frame5;
@property(nonatomic, assign) CGRect frame6;

@end

@implementation BFCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.ImageViewsArray = [NSMutableArray new];
    self.ImageViewsFramesArray = [NSMutableArray new];
    UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    UIPanGestureRecognizer *panRecognizer4 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    UIPanGestureRecognizer *panRecognizer5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    UIPanGestureRecognizer *panRecognizer6 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    
    UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    UITapGestureRecognizer *tapRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    UITapGestureRecognizer *tapRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    UITapGestureRecognizer *tapRecognizer5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    UITapGestureRecognizer *tapRecognizer6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnRight:)];
    
    [panRecognizer1 setDelegate:self];
    [panRecognizer2 setDelegate:self];
    [panRecognizer3 setDelegate:self];
    [panRecognizer4 setDelegate:self];
    [panRecognizer5 setDelegate:self];
    [panRecognizer6 setDelegate:self];
    
    [tapRecognizer1 setDelegate:self];
    [tapRecognizer2 setDelegate:self];
    [tapRecognizer3 setDelegate:self];
    [tapRecognizer4 setDelegate:self];
    [tapRecognizer5 setDelegate:self];
    [tapRecognizer6 setDelegate:self];
    
    [self.imageView1 addGestureRecognizer:panRecognizer1];
    [self.imageView2 addGestureRecognizer:panRecognizer2];
    [self.imageView3 addGestureRecognizer:panRecognizer3];
    [self.imageView4 addGestureRecognizer:panRecognizer4];
    [self.imageView5 addGestureRecognizer:panRecognizer5];
    [self.imageView6 addGestureRecognizer:panRecognizer6];
    
    [self.imageView1 addGestureRecognizer:tapRecognizer1];
    [self.imageView2 addGestureRecognizer:tapRecognizer2];
    [self.imageView3 addGestureRecognizer:tapRecognizer3];
    [self.imageView4 addGestureRecognizer:tapRecognizer4];
    [self.imageView5 addGestureRecognizer:tapRecognizer5];
    [self.imageView6 addGestureRecognizer:tapRecognizer6];
    
    self.imageView1.tag = 0;
    self.imageView2.tag = 1;
    self.imageView3.tag = 2;
    self.imageView4.tag = 3;
    self.imageView5.tag = 4;
    self.imageView6.tag = 5;
    
    
    self.imageView1.userInteractionEnabled = YES;
    self.imageView2.userInteractionEnabled = YES;
    self.imageView3.userInteractionEnabled = YES;
    self.imageView4.userInteractionEnabled = YES;
    self.imageView5.userInteractionEnabled = YES;
    self.imageView6.userInteractionEnabled = YES;
    
    self.frame1 = self.imageView1.frame;
    self.frame2 = self.imageView2.frame;
    self.frame3 = self.imageView3.frame;
    self.frame4 = self.imageView4.frame;
    self.frame5 = self.imageView5.frame;
    self.frame6 = self.imageView6.frame;
    
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame1]];
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame2]];
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame3]];
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame4]];
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame5]];
    [self.ImageViewsFramesArray addObject:[NSValue valueWithCGRect:self.frame6]];
    
    [self.ImageViewsArray addObject:self.imageView1];
    [self.ImageViewsArray addObject:self.imageView2];
    [self.ImageViewsArray addObject:self.imageView3];
    [self.ImageViewsArray addObject:self.imageView4];
    [self.ImageViewsArray addObject:self.imageView5];
    [self.ImageViewsArray addObject:self.imageView6];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveRight:(UIPanGestureRecognizer *)gesture{
    
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        //if needed do some initial setup or init of views here
    }
    else if(gesture.state == UIGestureRecognizerStateChanged)
    {
        //move your views here.
        //self.imageView1 setFrame:<#(CGRect)#>
        //[self.imageView2 setFrame:selectedImageView.frame];
        
        CGPoint translation = [gesture translationInView:self.view];
        gesture.view.center = CGPointMake(gesture.view.center.x + translation.x,
                                          gesture.view.center.y + translation.y);
        [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
        
        
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {
        //else do cleanup
        
        CGRect initialFrame = [[self.ImageViewsFramesArray objectAtIndex:gesture.view.tag] CGRectValue];
        
        
        for (UIImageView *destImageView in self.ImageViewsArray) {
            if (destImageView == gesture.view) {
                continue;
            }
            if (CGRectIntersectsRect(gesture.view.frame, destImageView.frame)) {
                gesture.view.frame = destImageView.frame;
                destImageView.frame = initialFrame;
                
                [self.ImageViewsFramesArray replaceObjectAtIndex:gesture.view.tag withObject:[NSValue valueWithCGRect:destImageView.frame]];
                
                NSUInteger sourceTag = gesture.view.tag;
                gesture.view.tag = destImageView.tag;
                destImageView.tag = sourceTag;
                
                break;
            }
        }
        
    }
    
}

-(void)turnRight:(UITapGestureRecognizer *)sender{
    CGFloat radians = atan2f(sender.view.transform.b, sender.view.transform.a);
    CGFloat num = 1.57079637;
    
    if(radians == num){
        sender.view.transform = CGAffineTransformMakeRotation(0);
    }
    else{
        sender.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}
@end
