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
    case Drop
    case Tremble
}


extension UIView{
    fileprivate var SHeight: CGFloat{
        get{
            return self.bounds.height
        }
    }
    
    fileprivate var SWidth: CGFloat{
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
   
    
    func dismiss(withDuration duration: TimeInterval, animations: @escaping () -> ()){
    UIView.animate(withDuration: duration, animations: animations) { (_) in
            self.dismissView?.removeFromSuperview()
        }
    }
    
    func dismiss(){
        defaultDismiss()
    }
    
    func dismiss(withStyle style: AnimatedStyle){
        switch style {
        case .Default:
            defaultDismiss()
        case .Drop:
            dropDismiss()
        case .Tremble:
            trembleDismiss()
        }
    }
    func addDismissView(withStyle style: AnimatedStyle){
        for view in self.subviews{
            if view.tag == 1{
                return
            }
        }
        addDismissView()
        var tapGes: UITapGestureRecognizer = UITapGestureRecognizer()
        switch style {
        case .Default:
            tapGes = UITapGestureRecognizer(target: self, action: #selector(self.defaultDismiss))
        case .Drop:
            tapGes = UITapGestureRecognizer(target: self, action: #selector(self.dropDismiss))
        case .Tremble:
            tapGes = UITapGestureRecognizer(target: self, action: #selector(self.trembleDismiss))
        }
        self.addGestureRecognizer(tapGes)
    }
    
    func addDismissView(color: UIColor, alpha: CGFloat){
        var flag: Bool = false
        for view in self.subviews{
            if view.tag == 1{
                flag = true
            }
        }
        if !flag {
            addDismissView()
            addDismissView(withStyle: .Default)
        }else{
            dismissView?.backgroundColor = color
            dismissView?.alpha = alpha
        }
    }
}

extension UIView{
    fileprivate func addDismissView(){
        let dismissView = UIView(frame: CGRect(x: 0, y: 0, width: SWidth * 0.5, height: SHeight * 0.3))
        dismissView.layer.cornerRadius = 0.1 * dismissView.bounds.width
        dismissView.center = CGPoint(x: SWidth * 0.5, y: SHeight * 0.5)
        dismissView.backgroundColor = UIColor.white
        dismissView.tag = 1
        addSubview(dismissView)
        
     
    }
    //动画
    @objc fileprivate func defaultDismiss(){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dismissView?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.dismissView?.alpha = 0
        }) { (_) in
            self.dismissView?.removeFromSuperview()
        }
    }
    
    @objc fileprivate func dropDismiss(){
        dismissView?.layer.position = dismissView!.frame.origin
        dismissView?.layer.anchorPoint = CGPoint(x: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.dismissView?.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4) * 0.8, 0, 0, 1)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.dismissView?.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4) * 0.5, 0, 0, 1)
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.dismissView?.alpha = 0
                        let ty = self.dismissView!.superview!.frame.maxY
                        self.dismissView?.frame.origin.y = ty
                        }, completion: { (_) in
                            self.dismissView?.removeFromSuperview()
                    })
            })
        }
    }
    
    @objc fileprivate func trembleDismiss(){
        let angle = 3 / 180 * CGFloat(M_PI)
        let anim = CAKeyframeAnimation(keyPath: "transform.rotation")
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        anim.values = [angle,-angle]
        anim.autoreverses = true
        anim.repeatCount = MAXFLOAT
        anim.duration = 0.5
        anim.delegate = self
        fadeAnim.toValue = 0
        fadeAnim.duration = 0.5
        fadeAnim.delegate = self
        dismissView?.layer.add(anim, forKey: "anim")
        dismissView?.layer.add(fadeAnim, forKey: "fadeAnim")
    }
}


extension UIView: CAAnimationDelegate{
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dismissView?.removeFromSuperview()
    }
}
