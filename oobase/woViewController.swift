//
//  woViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/23.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit


//我页面
class woViewController: UIViewController, NSURLConnectionDataDelegate {
    

    var 个人信息: UIButton!
    var 项目管理: UIButton!
    var 账户安全: UIButton!
    var 成员申请: UIButton!
    var 消息中心: UIButton!
    var 发布项目: UIButton!
    var 我的关注: UIButton!
    var 应用中心: UIButton!
    var 退出: UIButton!
    

    var city: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainSize = UIScreen.mainScreen().bounds.size
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bk")!)

        
        //---------------------------------------------------------------------------------
        let url = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101250101.html")
        let data = NSData(contentsOfURL: url!)
        //        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        //        print(str)
        do{
            let json : AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            let data1: AnyObject = json.objectForKey("weatherinfo")!
            
            city = data1.objectForKey("city") as? String
        }catch let error as NSError{
            //打印错误消息
            print(error.code)
            print(error.description)
            
        }
        //-----------------------------------------------------------------------------------
        //从网站获取数据
        
        个人信息 = UIButton(frame: CGRectMake(10, 90, mainSize.width/2 - 15, 30))
        个人信息.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        个人信息.setTitle("个人信息", forState: UIControlState.Normal)
        个人信息.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        个人信息.layer.cornerRadius = 5//设置圆角
        个人信息.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        个人信息.addTarget(self, action: #selector(woViewController.btn个人信息), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(个人信息)
        
        项目管理 = UIButton(frame: CGRectMake(个人信息.frame.maxX + 10, 90, 个人信息.frame.width, 30))
        项目管理.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        项目管理.setTitle("项目管理", forState: UIControlState.Normal)
        项目管理.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        项目管理.layer.cornerRadius = 5//设置圆角
        项目管理.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        项目管理.addTarget(self, action: #selector(woViewController.btn项目管理), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(项目管理)
        
        账户安全 = UIButton(frame: CGRectMake(10, 个人信息.frame.maxY + 10, mainSize.width/2 - 15, 30))
        账户安全.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        账户安全.setTitle("账户安全", forState: UIControlState.Normal)
        账户安全.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        账户安全.layer.cornerRadius = 5//设置圆角
        账户安全.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        账户安全.addTarget(self, action: #selector(woViewController.btn账户安全), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(账户安全)
        
        成员申请 = UIButton(frame: CGRectMake(个人信息.frame.maxX + 10, 个人信息.frame.maxY + 10, 个人信息.frame.width, 30))
        成员申请.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        成员申请.setTitle("成员申请", forState: UIControlState.Normal)
        成员申请.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        成员申请.layer.cornerRadius = 5//设置圆角
        成员申请.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        成员申请.addTarget(self, action: #selector(woViewController.btn成员申请), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(成员申请)
        
        消息中心 = UIButton(frame: CGRectMake(10, 账户安全.frame.maxY + 10, mainSize.width/2 - 15, 30))
        消息中心.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        消息中心.setTitle("消息中心", forState: UIControlState.Normal)
        消息中心.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        消息中心.layer.cornerRadius = 5//设置圆角
        消息中心.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        消息中心.addTarget(self, action: #selector(woViewController.btn消息中心), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(消息中心)
        
        发布项目 = UIButton(frame: CGRectMake(个人信息.frame.maxX + 10, 账户安全.frame.maxY + 10, 个人信息.frame.width, 30))
        发布项目.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        发布项目.setTitle("发布项目", forState: UIControlState.Normal)
        发布项目.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        发布项目.layer.cornerRadius = 5//设置圆角
        发布项目.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        发布项目.addTarget(self, action: #selector(woViewController.btn发布项目), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(发布项目)
        
        我的关注 = UIButton(frame: CGRectMake(10, 消息中心.frame.maxY + 10, mainSize.width/2 - 15, 30))
        我的关注.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        我的关注.setTitle("我的关注", forState: UIControlState.Normal)
        我的关注.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        我的关注.layer.cornerRadius = 5//设置圆角
        我的关注.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        我的关注.addTarget(self, action: #selector(woViewController.btn我的关注), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(我的关注)
        
        应用中心 = UIButton(frame: CGRectMake(个人信息.frame.maxX + 10, 消息中心.frame.maxY + 10, 个人信息.frame.width, 30))
        应用中心.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        应用中心.setTitle("应用中心", forState: UIControlState.Normal)
        应用中心.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        应用中心.layer.cornerRadius = 5//设置圆角
        应用中心.backgroundColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 0.3)//背景颜色
        应用中心.addTarget(self, action: #selector(woViewController.btn应用中心), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(应用中心)
        
        退出 = UIButton(frame: CGRectMake(mainSize.width/2 - 个人信息.frame.width/2, 我的关注.frame.maxY + 10, 个人信息.frame.width, 30))
        退出.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        退出.setTitle("退出", forState: UIControlState.Normal)
        退出.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        退出.layer.cornerRadius = 5//设置圆角
        退出.backgroundColor = UIColor.redColor()//背景颜色
        退出.addTarget(self, action: #selector(woViewController.btn退出), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(退出)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
//        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false//结合userinfo 的代码实现单独隐藏导航
    }
    
    func btn个人信息() {
        print("个人信息")
        self.hidesBottomBarWhenPushed = true//结合userinfo 的代码实现单独隐藏导航
        let push: UserInfoViewController = UserInfoViewController()
        
        push.ID = city
//        presentViewController(UserInfoViewController(), animated: true, completion: nil)  //  模态转场方法
        self.navigationController?.pushViewController(push, animated: true)//show转场方法
        self.hidesBottomBarWhenPushed = false//结合userinfo 的代码实现单独隐藏导航
    }
    func btn项目管理() {
        print("项目管理")
    }
    func btn账户安全() {
        print("账户安全")
    }
    func btn成员申请() {
        print("成员申请")
    }
    func btn消息中心() {
        print("消息中心")
    }
    func btn发布项目() {
        print("发布项目")
    }
    func btn我的关注() {
        print("我的关注")
    }
    func btn应用中心() {
        print("应用中心")
    }
    func btn退出() {
        presentViewController(loginViewController(), animated: true, completion: nil)//转回登陆界面
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
