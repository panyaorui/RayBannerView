# RayBannerView
多图片无缝滑动

# 动画效果

![image](https://github.com/panyaorui/RayBannerView/blob/master/效果图/01.gif)

#功能说明
##1.支持无限循环
##2.支持本地和网络图片两种加载方式（基于SDWebImage）
##3.支持定时滑动
##4.支持xib界面自动布局

#使用说明
```swift
        //网络图片
        bannerView.address = .Web(["http://img0.ph.126.net/SeZND7sJY2E9817aqyiF9Q==/6608636628980965995.jpg","http://img0.ph.126.net/Gqoi8jy24MIqewWmUNUVcA==/639792622080629406.jpg","http://img1.ph.126.net/tWT4rtsPXrsoPyVrjvP4uQ==/1120551882302603980.jpg"]);
         //本地图片
        bannerView.address = .Local(["1","2","3"]);
        //指示器颜色
        bannerView.currentColor = UIColor.blueColor();
```
