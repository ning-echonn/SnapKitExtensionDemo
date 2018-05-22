//
//  ViewController.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func adaptiveExample(_ sender: UIButton) {
        self.navigationController?.pushViewController(AdaptiveExampleViewController(), animated: true)
    }
    
    @IBAction func verticalExample(_ sender: UIButton) {
        self.navigationController?.pushViewController(VerticalExampleViewController(), animated: true)
    }
    
    @IBAction func horizontalExample(_ sender: UIButton) {
        self.navigationController?.pushViewController(HorizontalViewController(), animated: true)
    }
    
    @IBAction func SudokuExample(_ sender: UIButton) {
        self.navigationController?.pushViewController(SudokuExampleViewController(), animated: true)
    }
    
}

