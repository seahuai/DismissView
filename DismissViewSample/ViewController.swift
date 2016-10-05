//
//  ViewController.swift
//  DismissViewSample
//
//  Created by 张思槐 on 16/10/1.
//  Copyright © 2016年 zhangsihuai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        testView.addDismissView()
        print(testView.subviews)
//        testView.dismiss(withDuration: 2.0) { (dismissView) in
//            dismissView?.alpha = 0
//            dismissView?.frame.size.height = 200
//        }
    }
    
    @IBAction func buttonClick(_ sender: AnyObject) {
        testView.dismiss(withDuration: 2.0) {
            self.testView.dismissView?.backgroundColor = UIColor.blue
            self.testView.dismissView?.alpha = 0.5
        }
    }
   

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

