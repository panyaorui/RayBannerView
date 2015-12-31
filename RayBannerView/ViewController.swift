//
//  ViewController.swift
//  RayBannerView
//
//  Created by ray on 15/12/29.
//  Copyright © 2015年 ray. All rights reserved.
//

import UIKit
import SDWebImage



class ViewController: UIViewController {

    @IBOutlet weak var bannerView: BannerView!
    @IBOutlet weak var imag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //网络图片
        bannerView.address = .Web(["http://img0.ph.126.net/SeZND7sJY2E9817aqyiF9Q==/6608636628980965995.jpg","http://img0.ph.126.net/Gqoi8jy24MIqewWmUNUVcA==/639792622080629406.jpg","http://img1.ph.126.net/tWT4rtsPXrsoPyVrjvP4uQ==/1120551882302603980.jpg"]);
         //本地图片
        bannerView.address = .Local(["1","2","3"]);
        //指示器颜色
        bannerView.currentColor = UIColor.blueColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

