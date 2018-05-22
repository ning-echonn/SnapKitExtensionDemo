//
//  HorizontalViewController.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

class HorizontalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
        
        self.title = "水平分布View"
        
        example1()
        
        example2()
    }
    
    private func example1() {
        
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "每个View的宽度相等，高度相等"
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        var btnArr: [UIButton] = []
        var textArr = ["button 1", "button 123", "button 123456789"]
        
        
        for i in 0..<textArr.count {
            let btn = UIButton()
            btn.setTitle(textArr[i], for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = UIColor.red
            self.view.addSubview(btn)
            btnArr.append(btn)
            
        }
        
        // fixedItemLength 水平时，是每个view的固定宽度, 默认为 nil, 可不传，不传的例子见下面
        btnArr.snp.distributeViewsAlong(axisType: .horizontal, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(10, 20, 0, 20), fixedItemLength: 70, topConstrainView: label)
    }
    
    private func example2() {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "每个View的宽度、高度不相等"
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(320)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        var btnArr: [UIButton] = []
        var textArr = ["button 1", "button 123", "button 123456789"]
        
        
        for i in 0..<textArr.count {
            let btn = UIButton()
            btn.setTitle(textArr[i], for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = UIColor.blue
            self.view.addSubview(btn)
            btnArr.append(btn)
            
            btn.snp.makeConstraints({ (make) in
                make.width.equalTo((i + 1) * 40)
                make.height.equalTo((i + 1) * 20)
            })
        }
        
        // fixedItemLength 为nil 时， 可为每个view设置宽高，
        // 当然，也可以不设置宽度，但是对高度一些可以不设置，比如label、button
        btnArr.snp.distributeViewsAlong(axisType: .horizontal, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(360, 20, 0, 20))
    }

}
