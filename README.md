# RayBannerView
多图片无缝滑动

# 动画效果

![image](https://github.com/panyaorui/RayBannerView/blob/master/效果图/01.gif)

#功能说明
##1.支持无限循环
##2.支持本地和网络图片两种加载方式（基于SDWebImage）
##3.支持定时滑动
##4.支持xib界面自动布局
##5.支持直接调转ViewController
##6.支持监听图片点击事件

#使用说明
```swift
//网络图片
        //bannerView.address = .Web(["http://img0.ph.126.net/SeZND7sJY2E9817aqyiF9Q==/6608636628980965995.jpg","http://img0.ph.126.net/Gqoi8jy24MIqewWmUNUVcA==/639792622080629406.jpg","http://img1.ph.126.net/tWT4rtsPXrsoPyVrjvP4uQ==/1120551882302603980.jpg"]);
         //本地图片
        bannerView.address = .Local(["1","2","3"]);
        //bannerView代理，用来监听点击图片事件,ViewController需要继承自BannerViewDelegate
        bannerView.delegate = self;
        let controller = RayViewController(nibName: "RayViewController", bundle: nil);
        //单击图片直接跳转到对应的viewController，在没有设置delegate时生效，设置之后在不生效
        bannerView.controllers = [controller,controller,controller];
        //指示器颜色
        bannerView.currentColor = UIColor.blueColor();
```
