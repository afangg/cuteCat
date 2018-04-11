//
//  CustomerTabBar.swift
//  cuteCat
//
//  Created by Alisha Fong on 4/6/18.
//  Copyright © 2018 Alisha Fong. All rights reserved.
//

import UIKit
import NotificationBanner

class CustomerTabBar: UITabBarController, NotificationBannerDelegate {
   
    func notificationBannerClick(_ view: NotificationBannerView) {
        
        //Dissmiss NotificationBanner
        dissmissBanner(completion: { Sucess in _ = Bool()
            if(Sucess){
                
            }
        }
        )
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItems = tabBar.items! as [UITabBarItem]
        for tabBarItem in tabBarItems
        {
            tabBarItem.title = nil
            tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }


        // Do any additional setup after loading the view.
    }


}
