//
//  BannerView.swift
//  RayBannerView
//
//  Created by ray on 15/12/29.
//  Copyright © 2015年 ray. All rights reserved.
//

import UIKit
import SDWebImage

enum BannerViewAddress<Array> {
    case Web(Array);
    case Local(Array);
    
    var isWeb:Bool{
        switch self{
        case .Web:
            return true;
        default:
            return false;
        }
    }
    
    var value:Array{
        switch self{
        case .Web(let array):
            return array;
        case .Local(let array):
            return array;
        }
    }
}

class BannerView: UIView,UIScrollViewDelegate {
    
    /* 公开属性*/
    
     /** 图片名称或者地址数组*/
    var address:BannerViewAddress<[String]>?{
        didSet{
            if(self.images == nil){
                self.images = NSMutableArray();
                self.images!.addObject(address!.value[address!.value.count - 1]);
                self.images!.addObjectsFromArray(address!.value);
                self.images!.addObject(address!.value[0]);
            }
            //设置页面
            self.pageControl.numberOfPages = self.images!.count - 2;
            self.pageControl.currentPage = 0;
            //将图片添加到ScrollView
            self.addSubImageView();
        }
    };
    
    /** 分页 当前选中 显示的颜色*/
    var currentColor:UIColor = UIColor.redColor(){
        didSet{
            self.pageControl.currentPageIndicatorTintColor = currentColor;
        }
    };

    /**分页 其他 显示的颜色*/
    var pageColor:UIColor = UIColor.whiteColor(){
        didSet{
            self.pageControl.pageIndicatorTintColor = pageColor;
        }
    };
    
    var scrollInterval:NSTimeInterval = 3{
        didSet{
            
        }
    }
    
    /** 私有属性*/
    private var scrollview:UIScrollView!;
    private var pageControl:UIPageControl!;
    private var width:CGFloat!;
    private var height:CGFloat!;
    private var pageControlHeight:CGFloat = 20;
    private var currentPage:Int = 1;
    private var images:NSMutableArray?;
    private var timer:NSTimer?;
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib();
        self.backgroundColor = UIColor.orangeColor();
        self.width = self.frame.size.width;
        self.height = self.frame.size.height;
        
        self.initScrollView();
        self.initPageControl();
        self.addTimer();
    }
    
    /** 初始化ScrollView*/
    private func initScrollView(){
        scrollview = UIScrollView(frame: CGRectMake(0, 0, self.width, self.height));
        //scrollview.backgroundColor = UIColor.blueColor();
        scrollview.contentSize = CGSize(width: self.width, height: self.height);
        self.scrollview.pagingEnabled = true;
        self.scrollview.showsVerticalScrollIndicator = false;
        self.scrollview.showsHorizontalScrollIndicator = false;
        self.scrollview.delegate = self;
        self.addSubview(scrollview);
    }
    
    /** 初始化Page*/
    private func initPageControl(){
        self.pageControl = UIPageControl(frame: CGRectMake(0, self.height - self.pageControlHeight, self.width, self.pageControlHeight));
        self.pageControl.currentPageIndicatorTintColor = self.currentColor;
        self.pageControl.pageIndicatorTintColor = self.pageColor;
        self.pageControl.currentPage = self.currentPage;
        self.addSubview(self.pageControl);
    }
    
    /** 添加图片*/
    private func addSubImageView(){
        self.scrollview.contentSize = CGSize(width: self.width  * CGFloat(self.images!.count), height: self.height);
        for var index = 0; index < self.images!.count;++index{
            let name:String = self.images!.objectAtIndex(index) as! String;

            let imageView:UIImageView = UIImageView(frame: CGRectMake(self.width * CGFloat(index), 0, self.width, self.height));
            imageView.clipsToBounds = true;
            if(self.address!.isWeb){
                 imageView.sd_setImageWithURL(NSURL(string: name), placeholderImage: UIImage(named: "1"));
            }else{
                let image:UIImage = UIImage(named: name)!;
                imageView.image = image;
            }
            self.scrollview.addSubview(imageView);
        }
        self.scrollview.contentOffset = CGPointMake(self.width, 0);
    }
    
    private func addTimer(){
        if(self.timer == nil){
            self.timer = NSTimer.scheduledTimerWithTimeInterval(self.scrollInterval, target:self , selector: "next", userInfo: nil, repeats: true);
       //     self.timer!.fire();
        }
    }
    
    /** 滑动到下一张图片*/
    func next(){
        var current = self.pageControl.currentPage + 1;
        let point = CGPoint(x: self.width + self.width * CGFloat(current),y: 0);
         self.scrollview.setContentOffset(point,animated: true);
        if(current == self.images!.count - 2){
            let p = CGPoint(x: 0, y: 0);
           self.scrollview.contentOffset = p;
            current = 0;
        }
        self.pageControl.currentPage = current;
    }
    
    ////////////////////////////// UIScrollViewDelegate //////////////////////////////

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page:Int = Int(scrollview.contentOffset.x / self.width);
        if(page == 0){
            self.scrollview.contentOffset = CGPointMake(self.width * CGFloat(self.images!.count - 2), 0);
            self.pageControl.currentPage = self.images!.count - 2;
            return;
        }
        if(page == self.images!.count - 1){
           self.scrollview.contentOffset = CGPointMake(self.width, 0);
            self.pageControl.currentPage = 0;
            return;
        }
        let p:Int = Int(scrollview.contentOffset.x / self.width);
        self.pageControl.currentPage = p-1;
    }
  
}
