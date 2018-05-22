
//
//  AdaptiveExampleViewController.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

class AdaptiveExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
        self.title = "自适应宽度分布View"
        
        initView()
    }
    
    private func initView() {
        
        
        let label = UILabel()
        label.text = "自适应文字宽度的一堆button"
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        let textPadding: CGFloat = 10.0
        var btnArr: [UIButton] = []
        var textArr = ["button 1", "button 123", "button 123456789", "button 45", "button 33234", "button", "hi", "this", "is", "a", "example", "only a example"]
        var textWidth: [CGFloat] = []
        
        for i in 0..<textArr.count {
            let btn = UIButton()
            btn.setTitle(textArr[i], for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = UIColor.red
            self.view.addSubview(btn)
            btnArr.append(btn)
            
            let btnW = textArr[i].size(withFont: (btn.titleLabel?.font)!).width + textPadding * 2
            textWidth.append(btnW)
        }
        
        // verticalSpacing   每个view之间的垂直距离
        // horizontalSpacing 每个view之间的水平距离
        // maxWidth 是整个布局的最大宽度，需要事前传入，比如 self.view.bounds.size.width - 40
        // textWidth 是每个view的宽度，也需事前计算好
        // itemHeight 每个view的高度
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        btnArr.snp.distributeDetermineWidthViews(verticalSpacing: 20, horizontalSpacing: 10, maxWidth: self.view.bounds.size.width - 40, determineWidths: textWidth, itemHeight: 30, edgeInset: UIEdgeInsetsMake(20, 20, 0, 20), topConstrainView: label)
    }
}
