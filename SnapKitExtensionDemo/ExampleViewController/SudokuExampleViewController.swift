//
//  SudokuExampleViewController.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

class SudokuExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
        self.title = "九宫格分布"
        
        example1()
        
        example2()
    }
    
    private func example1() {
        self.view.backgroundColor = .white
        
        let container = UIView()
        container.backgroundColor = .yellow
        self.view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(200)
        }
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "九宫格分布，item之间边距确定,未指定高度，那么按容器的高度平均分布"
        container.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        var views: [UIView] = []
        for _ in 0..<9 {
            let view = UIView()
            view.backgroundColor = .green
            container.addSubview(view)
            views.append(view)
        }

        // verticalSpacing   每个view之间的垂直距离
        // horizontalSpacing 每个view之间的水平距离
        // warpCount 每行多少列
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // itemHeight 每个view的高度， 默认为 nil，可以不指定，那么每个view的高度就按整个容器的高度来确定
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        views.snp.distributeSudokuViews(verticalSpacing: 10, horizontalSpacing: 30, warpCount: 3, edgeInset: UIEdgeInsetsMake(10, 10, 10, 10), itemHeight: nil, topConstrainView: label)
    }
    
    private func example2() {
        self.view.backgroundColor = .white
        
        let container = UIView()
        container.backgroundColor = .orange
        self.view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(360)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(300)
        }
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "九宫格分布，item之间边距确定, 指定高度"
        container.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        var views: [UIView] = []
        for _ in 0..<9 {
            let view = UIView()
            view.backgroundColor = .blue
            container.addSubview(view)
            views.append(view)
        }
        
        // itemHeight 每个view的高度指定
        views.snp.distributeSudokuViews(verticalSpacing: 10, horizontalSpacing: 30, warpCount: 3, edgeInset: UIEdgeInsetsMake(10, 10, 10, 10), itemHeight: 20, topConstrainView: label)
    }

}
