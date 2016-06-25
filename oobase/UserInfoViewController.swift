//
//  UserInfoViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/31.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit


class UserInfoViewController: UIViewController, UITextFieldDelegate {
    
//    let 返回 = UIButton(type: .Custom)
//    let 保存 = UIButton(type: .Custom)
    
    var ID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let mainSize = UIScreen.mainScreen().bounds
        
        woViewController().city = ID
//        self.navigationController?.navigationBarHidden = true
        
        self.tabBarController?.tabBar.hidden = true  //结合woviewcontroller 的代码实现单独隐藏导航
        
//        //---------------------------------------------------------------------------------
//        let url = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101250101.html")
//        let data = NSData(contentsOfURL: url!)
////        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
////        print(str)
//        do{
//            let json : AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
//            let data1: AnyObject = json.objectForKey("weatherinfo")!
//            
//            city = data1.objectForKey("city") as? String
//        }catch let error as NSError{
//            //打印错误消息
//            print(error.code)
//            print(error.description)
//            
//        }
//        //-----------------------------------------------------------------------------------
//        //从网站获取数据
        
        //页面标题
        let title = UILabel()
        title.frame = CGRectMake(mainSize.width/2 - 40, 30, 80, 30)
        title.text = "个人详情"
        title.textAlignment = .Center
        self.view.addSubview(title)
        
        let item = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(UserInfoViewController.editing as (UserInfoViewController) -> () -> ()))
        
        self.navigationItem.rightBarButtonItem = item//创建右边保存按钮
        
//        //返回按钮
//        返回.frame = CGRectMake(10, 30, 50, 25)
//        返回.setTitle("返回", forState: UIControlState.Normal)
//        返回.setTitleColor(UIColor.blueColor(), forState: .Highlighted)
//        返回.layer.cornerRadius = 5//设置圆角
//        返回.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1)//背景颜色
//        返回.addTarget(self, action: #selector(UserInfoViewController.getBack), forControlEvents: .TouchUpInside)//按钮事件
//        self.view.addSubview(返回)
        
//        //保存按钮
//        保存.frame = CGRectMake(mainSize.width - 60, 30, 50, 25)
//        保存.setTitle("保存", forState: UIControlState.Normal)
//        保存.setTitleColor(UIColor.blueColor(), forState: .Highlighted)
//        保存.layer.cornerRadius = 5//设置圆角
//        保存.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1)//背景颜色
//        保存.addTarget(self, action: #selector(UserInfoViewController.editing), forControlEvents: .TouchUpInside)//按钮事件
//        self.view.addSubview(保存)
        
        //姓名模块
        let name = UILabel()
        name.frame = CGRectMake(10, 80, 40, 30)
        name.text = "姓名:"
        self.view.addSubview(name)
        
        let getName = UITextField()
        getName.frame = CGRectMake(name.frame.maxX + 5, name.frame.minY, mainSize.width - name.frame.maxX - 10, name.frame.height)
        getName.borderStyle = UITextBorderStyle.RoundedRect //圆角框
        getName.adjustsFontSizeToFitWidth = true//文本超过框时缩小字体
        getName.clearButtonMode = .WhileEditing //设置右边清除按钮在编辑时出现
        getName.textAlignment = .Left //设置文字左对齐
        getName.userInteractionEnabled = true//默认不允许编辑
        getName.delegate = self//设置代理为本页面
        getName.text = "秋水-ID:\(ID))"
        self.view.addSubview(getName)
        
        //性别模块
        let sex = UILabel()
        sex.frame = CGRectMake(10, name.frame.maxY + 5, 40, 30)
        sex.text = "性别:"
        self.view.addSubview(sex)
        
        let getSex = UITextField()
        getSex.frame = CGRectMake(sex.frame.maxX + 5, sex.frame.minY, mainSize.width - sex.frame.maxX - 10, sex.frame.height)
        getSex.borderStyle = UITextBorderStyle.RoundedRect //圆角框
        getSex.adjustsFontSizeToFitWidth = true//文本超过框时缩小字体
        getSex.clearButtonMode = .WhileEditing //设置右边清除按钮在编辑时出现
        getSex.textAlignment = .Left //设置文字左对齐
        getSex.userInteractionEnabled = true//默认不允许编辑
        getSex.delegate = self//设置代理为本页面
        getSex.text = "中性"
        self.view.addSubview(getSex)
        
        //生日模块
        let birthday = UILabel()
        birthday.frame = CGRectMake(10, sex.frame.maxY + 5, 40, 30)
        birthday.text = "生日:"
        self.view.addSubview(birthday)
        
        let getBirthday = UITextField()
        getBirthday.frame = CGRectMake(birthday.frame.maxX + 5, birthday.frame.minY, mainSize.width - birthday.frame.maxX - 10, birthday.frame.height)
        getBirthday.borderStyle = UITextBorderStyle.RoundedRect //圆角框
        getBirthday.adjustsFontSizeToFitWidth = true//文本超过框时缩小字体
        getBirthday.clearButtonMode = .WhileEditing //设置右边清除按钮在编辑时出现
        getBirthday.textAlignment = .Left //设置文字左对齐
        getBirthday.userInteractionEnabled = true//默认不允许编辑
        getBirthday.delegate = self//设置代理为本页面
        getBirthday.text = "2000-0-0"
        self.view.addSubview(getBirthday)
        
        //地址模块
        let address = UILabel()
        address.frame = CGRectMake(10, birthday.frame.maxY + 5, 40, 30)
        address.text = "地址:"
        self.view.addSubview(address)
        
        let getAddress = UITextField()
        getAddress.frame = CGRectMake(address.frame.maxX + 5, address.frame.minY, mainSize.width - address.frame.maxX - 10, address.frame.height)
        getAddress.borderStyle = UITextBorderStyle.RoundedRect //圆角框
        getAddress.adjustsFontSizeToFitWidth = true//文本超过框时缩小字体
        getAddress.clearButtonMode = .WhileEditing //设置右边清除按钮在编辑时出现
        getAddress.textAlignment = .Left //设置文字左对齐
        getAddress.userInteractionEnabled = true//默认不允许编辑
        getAddress.delegate = self//设置代理为本页面
        getAddress.text = ""
        self.view.addSubview(getAddress)
        
        //简介模块
        let Profile = UILabel()
        Profile.frame = CGRectMake(10, address.frame.maxY + 5, 40, 30)
        Profile.text = "简介:"
        self.view.addSubview(Profile)
        
        let getProfile = UITextView()
        getProfile.frame = CGRectMake(Profile.frame.maxX + 5, Profile.frame.minY, mainSize.width - Profile.frame.maxX - 10, Profile.frame.height * 3)
        getProfile.layer.borderWidth = 2
        getProfile.layer.borderColor = UIColor.redColor().CGColor
        getProfile.layer.cornerRadius = 5
        getProfile.text = "这个人很懒什么都没留下"
        self.view.addSubview(getProfile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func editing() {
        print("点了保存")
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
