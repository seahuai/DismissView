//
//  UIView+Extension.swift
//  DismissViewSample
//
//  Created by 张思槐 on 16/10/1.
//  Copyright © 2016年 zhangsihuai. All rights reserved.
//

import UIKit

enum AnimatedStyle{
    case Default
}


extension UIView{
    private var SHeight: CGFloat{
        get{
            return self.bounds.height
        }
    }
    
    private var SWidth: CGFloat{
        get{
            return self.bounds.width
        }
    }
    
    var dismissView: UIView?{
        get{
            
            for view in self.subviews{
                if view.tag == 1{
                    return view
                }
            }
         return nil
        }
    }
   
    
    @objc private func defaultDismiss(){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dismissView?
                .alpha = 0
        }) { (_) in
            self.dismissView?.removeFromSuperview()
        }
    }
    
    func dismiss(withDuration duration: TimeInterval, animations: @escaping () -> ()){
    UIView.animate(withDuration: duration, animations: animations) { (_) in
            self.dismissView?.removeFromSuperview()
        }
        
    }
    
    func dismiss(){
        defaultDismiss()
    }
    
    func addDismissView(){
        for view in self.subviews{
            if view.tag == 1{
                return
            }
        }
        let tagGes = UITapGestureRecognizer(target: self, action: #selector(self.defaultDismiss))
        self.addGestureRecognizer(tagGes)
        let dismissView = UIView(frame: CGRect(x: 0, y: 0, width: SWidth * 0.5, height: SHeight * 0.3))
        dismissView.layer.cornerRadius = 0.1 * dismissView.bounds.width
        dismissView.center = self.center
        dismissView.backgroundColor = UIColor.white
        dismissView.tag = 1
        addSubview(dismissView)
    }
    
    func addDismissView(color: UIColor, alpha: CGFloat){
        var flag: Bool = false
        for view in self.subviews{
            if view.tag == 1{
                flag = true
            }
        }
        if flag {
            let tagGes = UITapGestureRecognizer(target: self, action: #selector(self.defaultDismiss))
            self.addGestureRecognizer(tagGes)
            let dismissView = UIView(frame: CGRect(x: 0, y: 0, width: SWidth * 0.5, height: SHeight * 0.3))
            dismissView.layer.cornerRadius = 0.1 * dismissView.bounds.width
            dismissView.center = self.center
            dismissView.backgroundColor = color
            dismissView.alpha = alpha
            dismissView.tag = 1
            addSubview(dismissView)
        }else{
            self.subviews.first?.backgroundColor = color
            self.subviews.first?.alpha = alpha
        }
    }
    
//    func addDismissView(Animations: @escaping () -> ()) {
//        self.animations = Animations
//        let tagGes = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
//        self.addGestureRecognizer(tagGes)
//        let dismissView = UIView(frame: CGRect(x: 0, y: 0, width: SWidth * 0.5, height: SHeight * 0.3))
//        dismissView.layer.cornerRadius = 0.1 * dismissView.bounds.width
//        dismissView.center = self.center
//    }
    
//    func addDismissViewAnimated(withDuration: TimeInterval, animations: (_ dismissView: UIView) -> ()){
//        if self.subviews.count == 0{
//            let tagGes = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
//            self.addGestureRecognizer(tagGes)
//            let dismissView = UIView(frame: CGRect(x: 0, y: 0, width: SWidth * 0.5, height: SHeight * 0.3))
//            dismissView.layer.cornerRadius = 0.1 * dismissView.bounds.width
//            dismissView.center = self.center
//            animations(dismissView)
//        }else{
//            animations(self.subviews.first!)
//        }
//        
//    }

    
    
    
    
}
