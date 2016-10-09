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
//        view.addDismissView(withStyle: .Tremble)
//        self.view.addDismissView(withStyle: .Drop)
//        self.view.addDismissView(withStyle: .Default)
    }


}

