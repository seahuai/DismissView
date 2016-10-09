# DismissView

##Description
     提供了些方法可以对UIView添加一个包含消失动画的subView
##Demo
###默认
![Default](https://github.com/zhangsihuai/DismissView/blob/master/default.gif)
###掉落
![Drop](https://github.com/zhangsihuai/DismissView/blob/master/drop.gif)
###颤抖
![Tremble](https://github.com/zhangsihuai/DismissView/blob/master/tremble.gif)
##Install
    将工程内的UIView+Extension拖到自己的项目列表中

##Usage
```func addDismissView(withStyle: AnimatedStyle)```
    
    添加一个有动画类型的dismissView
    view.addDismissView(withStyle: .Tremble)
    view.addDismissView(withStyle: .Drop)
    view.addDismissView(withStyle: .Default)
    

``` func addDismissView(color: UIColor, alpha: CGFloat)```

    添加一个自定义颜色和透明度的dismissView
    view.addDismissView(color: UIColor.blue, alpha: 0.5)
    
``` func dismiss()```

``` func dismiss(withStyle style: AnimatedStyle)```

``` func dismiss(withDuration duration: TimeInterval, animations: @escaping () -> ())```
    
    调用以上方法用来消失动画（默认点击view消失dismissView）
    
    1>调用dismiss（）消失动画为.Default样式
    2>调用dismiss(withStyle style: AnimatedStyle) 用设定的消失样式消失
    3>可以通过调用dismiss(withDuration duration: TimeInterval, animations: @escaping () -> ())
    自定义消失动画