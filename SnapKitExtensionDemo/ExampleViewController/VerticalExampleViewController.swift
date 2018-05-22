//
//  VerticalExampleViewController.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

class VerticalExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
        
        self.title = "垂直分布View"
        
        example1()
        
        example2()
    }
    
    private func example1() {
        
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "每个View的左右边距相等，宽度相等，高度相等"
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
        
        // axisType   垂直或水平
        // fixedItemSpacing 每个view之间的距离
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // fixedItemLength 垂直时，是每个view的固定高度, 默认为 nil, 可不传，不传的例子见下面
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        btnArr.snp.distributeViewsAlong(axisType: .vertical, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(10, 40, 0, 40), fixedItemLength: 30, topConstrainView: label)
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
                make.height.equalTo((i + 1) * 20)
                make.width.equalTo((i + 1) * 40)
            })
        }
        
        // fixedItemLength 为nil 时， 可为每个view设置宽高，
        // 当然，也可以不设置宽度，但是对高度一些可以不设置，比如label、button
        btnArr.snp.distributeViewsAlong(axisType: .vertical, fixedItemSpacing: 30, edgeInset: UIEdgeInsetsMake(360, 20, 0, 20))
    }
}
