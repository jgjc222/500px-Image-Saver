#import "Tweak.h"

%hook PXPhotoImageView

-(id)initWithFrame:(CGRect)arg1{
	id s = %orig(arg1);
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(targetFunc:)];
    gesture.minimumPressDuration = 1;
    [s addGestureRecognizer:gesture];
	return s;
}
%new
-(void)targetFunc:(UIGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIImageView * imgv = [self imageView];
        UIImage *img = imgv.image;
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
        UIAlertView *alert = [[UIAlertView alloc]   initWithTitle:@"Saved!"
                                                    message:@"This photo has been to Camera Roll"
                                                    delegate:nil
                                                    cancelButtonTitle:@"Done"
                                                    otherButtonTitles:nil];
        [alert show];
    }
}
%end