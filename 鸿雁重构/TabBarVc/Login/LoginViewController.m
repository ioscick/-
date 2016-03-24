//
//  LoginViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/23.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginManager.h"
#import "UserModel.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    NSString *name;
    NSString *password;
}
@property (strong, nonatomic) UITextField *loginTextField;
@property (strong, nonatomic) UITextField *passwordTextField;

@property (strong, nonatomic) UILabel *loginLabel;
@property (strong, nonatomic) UILabel *passwordLabel;

@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    [self.view addSubview:self.loginLabel];
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.loginTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)loginLabel{
    if (_loginLabel == nil){
        _loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 100, 20)];
        _loginLabel.text = @"用户名：";
        _loginLabel.textColor = [UIColor grayColor];
        _loginLabel.textAlignment = NSTextAlignmentRight;
    }
    return _loginLabel;
}

- (UILabel *)passwordLabel{
    if (_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(_loginLabel.frame.origin.x, _loginLabel.frame.origin.y + _loginLabel.frame.size.height + 10, 100, 20)];
        _passwordLabel.text = @"密    码：";
        _passwordLabel.textColor = [UIColor grayColor];
        _passwordLabel.textAlignment = NSTextAlignmentRight;
    }
    return _passwordLabel;
}



- (UITextField *)loginTextField{
    if (_loginTextField == nil) {
        _loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(_loginLabel.frame.origin.x + _loginLabel.frame.size.width, _loginLabel.frame.origin.y, 200, 25)];
        _loginTextField.delegate = self;
        _loginTextField.returnKeyType = UIReturnKeyDone;
        _loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _loginTextField;
}

- (UITextField *)passwordTextField{
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(_passwordLabel.frame.origin.x + _passwordLabel.frame.size.width, _passwordLabel.frame.origin.y, 200, 25)];
        _passwordTextField.delegate = self;
        _passwordTextField.returnKeyType = UIReturnKeyDone;
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _passwordTextField;
}

- (UIButton *)loginButton{
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(30, _passwordTextField.frame.origin.y + _passwordTextField.frame.size.height + 50, WIDTH - 60, 30);
        _loginButton.backgroundColor = HongYardColor;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginItem) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton.layer masksToBounds];
        [_loginButton.layer setCornerRadius:5.0f];
    }
    return _loginButton;
}

- (void)loginItem{
    [self.view endEditing:YES];
    if (name.length == 0) {
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"用户名不能为空"];
        [self.view addSubview:message];
        return;
    }
    
    if (password.length == 0) {
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"密码不能为空"];
        [self.view addSubview:message];
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = UIPushBehaviorModeInstantaneous;
    [hud show:YES];
    [LoginManager postWithLoginNameStr:name password:password success:^(id json) {
        [hud hide:YES];
        [hud removeFromSuperview];
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"登录成功"];
        [self.view addSubview:message];
        
        UserModel *model = [[UserModel alloc] initWithDict:[json objectForKey:@"data"]];
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        if (userDef) {
            [userDef setObject:model.name forKey:@"name"];
            [userDef setObject:model.LoginName forKey:@"loginName"];
            [userDef setObject:model.cydm forKey:@"cydm"];
            [userDef setObject:model.lxhd forKey:@"lxdh"];
            [userDef setObject:model.txdz forKey:@"txdz"];
            [userDef setObject:model.type forKey:@"type"];
            [userDef synchronize];
        }
    } fail:^{
        [hud hide:YES];
        [hud removeFromSuperview];
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"登录失败"];
        [self.view addSubview:message];
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    name = self.loginTextField.text;
    password = self.passwordTextField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
