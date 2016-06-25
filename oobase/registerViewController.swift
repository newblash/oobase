//
//  registerViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/27.
//  Copyright © 2016年 YJ. All rights reserved.
//
//注册页面
import UIKit

class registerViewController: UIViewController, UITextFieldDelegate {

    var 返回: UIButton = UIButton(type: UIButtonType.Custom)
    var 确定: UIButton = UIButton(type: UIButtonType.Custom)
    //用户密码输入框
    var txtUser:UITextField!
    var txtPwd:UITextField!
    var txtpwd1:UITextField!
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bk")!)
        let mainSize = UIScreen.mainScreen().bounds.size
        
        let head = UIImageView(image: UIImage(named: "logo1"))//添加顶部logo
        head.frame = CGRectMake(10, 70, mainSize.width - 20, mainSize.height/5)
        head.contentMode = .ScaleAspectFit
        self.view.addSubview(head)
        
        let title = UILabel()
        title.frame = CGRectMake(mainSize.width/2 - 50, 20, 100, 40)
        title.text = "注册"
        title.backgroundColor = UIColor.clearColor()
        title.textColor = UIColor.redColor()
//        title.layer.cornerRadius = 3
//        title.alpha = 0.9
        title.textAlignment = .Center
        title.font = UIFont.boldSystemFontOfSize(mainSize.width/18)
        self.view.addSubview(title)
        

        
        //登录框背景
        let vLogin =  UIView(frame:CGRectMake(20, mainSize.height/2 - head.frame.height + 20, mainSize.width - 40, 180))
        vLogin.layer.borderWidth = 0.5
        vLogin.layer.cornerRadius = 10
        vLogin.layer.borderColor = UIColor.lightGrayColor().CGColor
        vLogin.backgroundColor = UIColor.whiteColor()
        vLogin.alpha = 0.8
        self.view.addSubview(vLogin)
        //用户名输入框
        txtUser = UITextField(frame:CGRectMake(10, 15, vLogin.frame.size.width - 20, 40))
        txtUser.delegate = self
        txtUser.layer.cornerRadius = 5
        txtUser.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtUser.layer.borderWidth = 0.5
        txtUser.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        txtUser.leftViewMode = UITextFieldViewMode.Always//左边显示为一直显示
        txtUser.clearButtonMode = .Always//右边清除用的小叉叉
        txtUser.autocapitalizationType = .None//首字母类型,默认关闭
        txtUser.placeholder = "请输入邮箱或手机号码"
        
        
        //用户名输入框左侧图标
        let imgUser =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgUser.image = UIImage(named:"iconfont-user")
        txtUser.leftView!.addSubview(imgUser)
        vLogin.addSubview(txtUser)
        
        //密码输入框
        txtPwd = UITextField(frame:CGRectMake(10, vLogin.frame.size.height/2 - 20, vLogin.frame.size.width - 20, 40))
        txtPwd.delegate = self
        txtPwd.layer.cornerRadius = 5
        txtPwd.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtPwd.layer.borderWidth = 0.5
        txtPwd.secureTextEntry = true
        txtPwd.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        txtPwd.leftViewMode = UITextFieldViewMode.Always
        txtPwd.clearButtonMode = .Always
        txtPwd.clearsOnBeginEditing = true//再次编辑清空
        txtPwd.placeholder = "请输入密码"
        
        //密码输入框左侧图标
        let imgPwd =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgPwd.image = UIImage(named:"iconfont-password")
        txtPwd.leftView!.addSubview(imgPwd)
        vLogin.addSubview(txtPwd)
        
        //密码重复输入框
        txtpwd1 = UITextField(frame:CGRectMake(10, vLogin.frame.size.height - 55, vLogin.frame.size.width - 20, 40))
        txtpwd1.delegate = self
        txtpwd1.layer.cornerRadius = 5
        txtpwd1.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtpwd1.layer.borderWidth = 0.5
        txtpwd1.secureTextEntry = true
        txtpwd1.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        txtpwd1.leftViewMode = UITextFieldViewMode.Always
        txtpwd1.clearButtonMode = .Always
        txtpwd1.clearsOnBeginEditing = true//再次编辑清空
        txtpwd1.placeholder = "请重复输入密码"
        
        //密码输入框左侧图标
        let imgPwd1 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgPwd1.image = UIImage(named:"iconfont-password")
        txtpwd1.leftView!.addSubview(imgPwd1)
        vLogin.addSubview(txtpwd1)
        // Do any additional setup after loading the view.
        

        确定 = UIButton(frame: CGRect(x: 20, y: vLogin.frame.maxY + 20, width: mainSize.width - 40, height: 30))
        确定.setTitleColor(UIColor.blueColor(), forState: .Highlighted)//点击之后变红色
        确定.setTitle("立即注册", forState: UIControlState.Normal)
        确定.layer.cornerRadius = 5//设置圆角
        确定.backgroundColor = UIColor(red: 100/255, green: 20/255, blue: 100/255, alpha: 1)//背景颜色
        确定.addTarget(self, action: #selector(registerViewController.tapped1), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(确定)
        
        
        返回 = UIButton(frame: CGRect(x: 确定.frame.minX, y: 确定.frame.maxY + 10, width: 确定.frame.width, height: 30))
        返回.setTitleColor(UIColor.blueColor(), forState: .Highlighted)//点击之后变红色
        返回.setTitle("取消注册", forState: UIControlState.Normal)
        返回.layer.cornerRadius = 5//设置圆角
        返回.backgroundColor = UIColor(red: 20/255, green: 100/255, blue: 20/255, alpha: 1)//背景颜色
        返回.addTarget(self, action: #selector(registerViewController.tapped), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(返回)
    }
    
    
    func tapped1(){
        if txtPwd.text == "" || txtpwd1.text == "" || txtUser == ""{
            alert = UIAlertController(title: "⚠️", message: "账号密码不能为空", preferredStyle: UIAlertControllerStyle.Alert)
//            let cancle = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(cancle)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }else if txtPwd.text != txtpwd1.text{
            alert = UIAlertController(title: "⚠️", message: "两次输入的密码不相同", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }else if txtPwd.text != "" && txtpwd1.text != "" && txtUser != ""{
            alert = UIAlertController(title: "注册成功", message: "你的账号为:\(txtUser.text!)", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "确定", style: .Default, handler: { (_) in
                self.presentViewController(loginViewController(), animated: true, completion: nil)
            })
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    func tapped(){
        dismissViewControllerAnimated(true, completion: nil) //返回上一个控制器方法
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
        txtUser.resignFirstResponder()
        txtPwd.resignFirstResponder()
        txtpwd1.resignFirstResponder()
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
