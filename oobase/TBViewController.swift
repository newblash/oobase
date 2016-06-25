//
//  TBViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/28.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

//导航控制器
class TBViewController: UITabBarController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let xiangmu = xiangmuTableViewController()
        xiangmu.title = "项目"
        
        let huoban = huobanTableViewController()
        huoban.title = "伙伴"
        let wo = woViewController()
        wo.title = "我"
        
        
        //分别声明视图控制器
        let 项目 = UINavigationController(rootViewController:xiangmu)
        项目.tabBarItem = UITabBarItem(title: "项目", image: UIImage(named: "xiangmu")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "xiangmuHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let 伙伴 = UINavigationController(rootViewController:huoban)
        伙伴.tabBarItem = UITabBarItem(title: "伙伴", image: UIImage(named: "huoban")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "huobanHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let 我 = UINavigationController(rootViewController:wo)
        我.tabBarItem = UITabBarItem(title: "我", image: UIImage(named: "wo")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "woHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        self.viewControllers = [项目,伙伴,我]
        
//        UITabBar.appearance().tintColor = UIColor.clearColor()//设置导航条背景
        //默认选中的视图
        self.selectedIndex = 0


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
