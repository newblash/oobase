//
//  loginViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/23.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit
import SafariServices
//登录框状态枚举
enum LoginShowType {
    case NONE
    case USER
    case PASS
}

class loginViewController: UIViewController, UITextFieldDelegate {
    
    var 登录: UIButton = UIButton(type: UIButtonType.Custom)
    var 注册: UIButton = UIButton(type: UIButtonType.Custom)
    var 关于我们: UIButton = UIButton(type: UIButtonType.Custom)
    
    var link = "http://www.oobase.com"
    
    
    
    
    //用户密码输入框
    var txtUser:UITextField!
    var txtPwd:UITextField!
    
    //左手离脑袋的距离
    var offsetLeftHand:CGFloat = 60
    
    //左手图片,右手图片(遮眼睛的)
    var imgLeftHand:UIImageView!
    var imgRightHand:UIImageView!
    
    //左手图片,右手图片(圆形的)
    var imgLeftHandGone:UIImageView!
    var imgRightHandGone:UIImageView!
    
    
    //登录框状态
    var showType:LoginShowType = LoginShowType.NONE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取屏幕尺寸
        let mainSize = UIScreen.mainScreen().bounds.size

        
        

            //猫头鹰头部
            let imgLogin =  UIImageView(frame:CGRectMake(mainSize.width/2-211/2, 40, 211, 109))
            imgLogin.image = UIImage(named:"owl-login")
            imgLogin.layer.masksToBounds = true
            self.view.addSubview(imgLogin)
            
            //猫头鹰左手(遮眼睛的)
            let rectLeftHand = CGRectMake(61 - offsetLeftHand, 90, 40, 65)
            imgLeftHand = UIImageView(frame:rectLeftHand)
            imgLeftHand.image = UIImage(named:"owl-login-arm-left")
            imgLogin.addSubview(imgLeftHand)
            
            //猫头鹰右手(遮眼睛的)
            let rectRightHand = CGRectMake(imgLogin.frame.size.width / 2 + 60, 90, 40, 65)
            imgRightHand = UIImageView(frame:rectRightHand)
            imgRightHand.image = UIImage(named:"owl-login-arm-right")
            imgLogin.addSubview(imgRightHand)
            
            //登录框背景
            let vLogin =  UIView(frame:CGRectMake(20, 140, mainSize.width - 40, 120))
            vLogin.layer.borderWidth = 0.5
            vLogin.layer.cornerRadius = 10
//            vLogin.alpha = 0.7//背景透明度
            vLogin.layer.borderColor = UIColor.lightGrayColor().CGColor
            vLogin.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(vLogin)
            
            //猫头鹰左手(圆形的)
            let rectLeftHandGone = CGRectMake(mainSize.width / 2 - 100,
                                              vLogin.frame.origin.y - 22, 40, 40)
            imgLeftHandGone = UIImageView(frame:rectLeftHandGone)
            imgLeftHandGone.image = UIImage(named:"icon_hand")
            self.view.addSubview(imgLeftHandGone)
            
            //猫头鹰右手(圆形的)
            let rectRightHandGone = CGRectMake(mainSize.width / 2 + 62,
                                               vLogin.frame.origin.y - 22, 40, 40)
            imgRightHandGone = UIImageView(frame:rectRightHandGone)
            imgRightHandGone.image = UIImage(named:"icon_hand")
            self.view.addSubview(imgRightHandGone)
            
            //用户名输入框
            txtUser = UITextField(frame:CGRectMake(15, 15, vLogin.frame.size.width - 30, 40))
            txtUser.delegate = self
            txtUser.layer.cornerRadius = 5
            txtUser.layer.borderColor = UIColor.lightGrayColor().CGColor
            txtUser.layer.borderWidth = 0.5
            txtUser.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
            txtUser.leftViewMode = UITextFieldViewMode.Always
            txtUser.clearButtonMode = .Always
            txtUser.autocapitalizationType = .None//首字母类型,默认关闭
            txtUser.placeholder = "请输入用户名!"
        
            
            //用户名输入框左侧图标
            let imgUser =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
            imgUser.image = UIImage(named:"iconfont-user")
            txtUser.leftView!.addSubview(imgUser)
            vLogin.addSubview(txtUser)
            
            //密码输入框
            txtPwd = UITextField(frame:CGRectMake(15, txtUser.frame.maxY + 10, vLogin.frame.size.width - 30, 40))
            txtPwd.delegate = self
            txtPwd.layer.cornerRadius = 5
            txtPwd.layer.borderColor = UIColor.lightGrayColor().CGColor
            txtPwd.layer.borderWidth = 0.5
            txtPwd.secureTextEntry = true
            txtPwd.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
            txtPwd.leftViewMode = UITextFieldViewMode.Always
            txtPwd.clearButtonMode = .Always
            txtPwd.placeholder = "请输入密码!"
            
            //密码输入框左侧图标
            let imgPwd =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
            imgPwd.image = UIImage(named:"iconfont-password")
            txtPwd.leftView!.addSubview(imgPwd)
            vLogin.addSubview(txtPwd)

        登录 = UIButton(frame: CGRectMake(20, vLogin.frame.maxY + 10, mainSize.width - 40, 30))
        登录.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        登录.setTitle("登录", forState: UIControlState.Normal)
        登录.layer.cornerRadius = 5//设置圆角
        登录.alpha = 0.7
        登录.backgroundColor = UIColor(red: 40/255, green: 100/255, blue: 200/255, alpha: 1)//背景颜色
        登录.addTarget(self, action: #selector(loginViewController.login), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(登录)
        
        注册 = UIButton(frame: CGRectMake(登录.frame.minX, 登录.frame.maxY + 10, mainSize.width - 40, 30))
        注册.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        注册.setTitle("注册", forState: UIControlState.Normal)
        注册.layer.cornerRadius = 5//设置圆角
        注册.alpha = 0.7
        注册.backgroundColor = UIColor(red: 100/255, green: 150/255, blue: 200/255, alpha: 1)//背景颜色
        注册.addTarget(self, action: #selector(loginViewController.register), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(注册)
        
        关于我们 = UIButton(frame: CGRectMake(20,注册.frame.maxY + 10, mainSize.width - 40, 30))
        关于我们.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        关于我们.setTitle("关于oobase", forState: UIControlState.Normal)
        关于我们.layer.cornerRadius = 5//设置圆角
        关于我们.alpha = 0.7
        关于我们.backgroundColor = UIColor(red: 200/255, green: 150/255, blue: 100/255, alpha: 1)//背景颜色
        关于我们.addTarget(self, action: #selector(loginViewController.about), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(关于我们)




        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bk")!)
        
        

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
        txtUser.resignFirstResponder()
        txtPwd.resignFirstResponder()
    }
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(textField:UITextField)
    {
        //如果当前是用户名输入
        if textField.isEqual(txtUser){
            if (showType != LoginShowType.PASS)
            {
                showType = LoginShowType.USER
                return
            }
            showType = LoginShowType.USER
            
            //播放不遮眼动画
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.imgLeftHand.frame = CGRectMake(
                    self.imgLeftHand.frame.origin.x - self.offsetLeftHand,
                    self.imgLeftHand.frame.origin.y + 30,
                    self.imgLeftHand.frame.size.width, self.imgLeftHand.frame.size.height)
                self.imgRightHand.frame = CGRectMake(
                    self.imgRightHand.frame.origin.x + 48,
                    self.imgRightHand.frame.origin.y + 30,
                    self.imgRightHand.frame.size.width, self.imgRightHand.frame.size.height)
                self.imgLeftHandGone.frame = CGRectMake(
                    self.imgLeftHandGone.frame.origin.x - 70,
                    self.imgLeftHandGone.frame.origin.y, 40, 40)
                self.imgRightHandGone.frame = CGRectMake(
                    self.imgRightHandGone.frame.origin.x + 30,
                    self.imgRightHandGone.frame.origin.y, 40, 40)
            })
        }
            //如果当前是密码名输入
        else if textField.isEqual(txtPwd){
            if (showType == LoginShowType.PASS)
            {
                showType = LoginShowType.PASS
                return
            }
            showType = LoginShowType.PASS
            
            //播放遮眼动画
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.imgLeftHand.frame = CGRectMake(
                    self.imgLeftHand.frame.origin.x + self.offsetLeftHand,
                    self.imgLeftHand.frame.origin.y - 30,
                    self.imgLeftHand.frame.size.width, self.imgLeftHand.frame.size.height)
                self.imgRightHand.frame = CGRectMake(
                    self.imgRightHand.frame.origin.x - 48,
                    self.imgRightHand.frame.origin.y - 30,
                    self.imgRightHand.frame.size.width, self.imgRightHand.frame.size.height)
                self.imgLeftHandGone.frame = CGRectMake(
                    self.imgLeftHandGone.frame.origin.x + 70,
                    self.imgLeftHandGone.frame.origin.y, 0, 0)
                self.imgRightHandGone.frame = CGRectMake(
                    self.imgRightHandGone.frame.origin.x - 30,
                    self.imgRightHandGone.frame.origin.y, 0, 0)
            })
        }
    }

    
    func login() {

        
        if txtPwd.text == "" && txtUser.text == "" {
            let alert = UIAlertController(title: "⚠️", message: "账号密码不能为空", preferredStyle: .Alert)
//            let cancle = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(cancle)
            alert.addAction(ok)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }else if txtUser.text != "admin" && txtPwd.text != "adimn"{
            let alert = UIAlertController(title: "⚠️", message: "账号或密码错误", preferredStyle: .Alert)
//            let cancle = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(cancle)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }else {
        presentViewController(TBViewController(), animated: true, completion: nil)//转场
        }
         presentViewController(TBViewController(), animated: true, completion: nil)//转场
    }
    
    func about(){//关于界面的跳转
        
        if 关于我们.touchInside {
//            if let url = NSURL(fileURLWithPath: link) {
//                UIApplication.sharedApplication().openURL(url)
//            }
            
            if let url1 = NSURL(string: link){
                UIApplication.sharedApplication().openURL(url1)
                
            }
//            let sfVC = SFSafariViewController(URL: NSURL(string: link)!, entersReaderIfAvailable: true)
//            presentViewController(sfVC, animated: true, completion: nil)

        }
    }
    
    func register(){//注册的跳转
        
        if 注册.touchInside {
            presentViewController(registerViewController(), animated: true, completion: nil)
                
            }
            
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
