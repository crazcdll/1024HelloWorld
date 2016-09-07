//
//  ViewController.m
//  1024HelloWorld
//
//  Created by zcdll on 16/9/3.
//  Copyright © 2016年 ZC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *languagePicker;

@property (weak, nonatomic) IBOutlet UILabel *languageLabel;

@property (strong, nonatomic) NSArray *languageArray;

@property (nonatomic, copy) NSString *language;

@property (weak, nonatomic) IBOutlet UITextView *helloWorldTextField;

@end

@implementation ViewController 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [_languageArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_languageArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
//    self.languageLabel.text = self.languageArray[row];
    
    _language = self.languageArray[row];
    
}

- (NSArray *)languageArray{
    
    if (_languageArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"languages" ofType:@"plist"];
        
        _languageArray = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _languageArray;
}

- (NSString *)helloWorldText:(NSString *)language {
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HelloWorlds" ofType:@"plist"];
    
    NSDictionary *helloWorldDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *helloWorldCode = [helloWorldDic objectForKey:language];
    
    return helloWorldCode;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.languagePicker.delegate = self;
    self.languagePicker.dataSource = self;
    
    [self languageArray];
    
    [self pickerView:_languagePicker didSelectRow:0 inComponent:0];
    
}

//- (void)viewDidLayoutSubviews{
//    
//    [self.languageLabel sizeToFit];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectButton:(id)sender {
    
    self.languageLabel.text = _language;
//    [self.languageLabel sizeToFit];
    
    self.helloWorldTextField.text = [self helloWorldText:_language];
    
}
@end
