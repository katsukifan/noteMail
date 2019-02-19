//
//  ViewController.m
//  noteMail
//
//  Created by 张岳涛 on 19/2/15.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>



@interface ViewController ()

<UITextViewDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end


@implementation ViewController

{
    
    __weak IBOutlet UITextView *noteTextView;

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [noteTextView resignFirstResponder];
}




- (IBAction)send:(id)sender {
    
    //メールを起動する準備をする
    MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
    
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"Mail services are not available.");
        return;
    }
    
    
    //デリゲートメソッドを使えるようにする
    mc.mailComposeDelegate = self;
    //件名を入れておく(この場合はメモ)
    [mc setSubject:@"メモ"];
    //本文を入れる(この場合はnoteTextViewの本文)
    [mc setMessageBody:noteTextView.text isHTML:NO];
    
    //メール画面の立ち上げ
    [self presentViewController:mc animated:YES completion:nil];
    
    
}


- (void)mailComposeController:( MFMailComposeViewController* )controller didFinishWithResult:( MFMailComposeResult )result error:( NSError* )error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    return;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
