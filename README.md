# SnapKitExtensionDemo
SnapKit 关于数组的扩展—— 自适应宽度、垂直、水平、九宫格布局

## 前言
用SnapKit这个第三方写自动布局，使用起来的确很舒服，但是对于Array却没有相关的支持，然后在网上找了这篇文 [SnapKit的扩展--添加数组控制约束,和九宫格布局,等宽,等间距等布局方式](https://blog.csdn.net/spicyShrimp/article/details/78070613) ，感谢

但是只有水平、垂直、九宫格布局，如果我想让多个button，按它的title的内容的宽度自适应排列呢，所以，决定自己写个扩展，参考了上面那篇文的代码，并做了一些修改。

其具体实现及Demo代码如下： [Github 地址](https://github.com/ning-echonn/SnapKitExtensionDemo)

仅供参考，希望有所帮助，如果你有什么好的方式，请告知，感谢。

以下为展示的效果例子及说明：

## 自适应宽度布局

![自适应宽度布局](https://img-blog.csdn.net/20180523172011131?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3puX2VjaG9ubg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

```
  public func distributeDetermineWidthViews(verticalSpacing: CGFloat,
                                              horizontalSpacing: CGFloat,
                                              maxWidth: CGFloat,
                                              determineWidths: [CGFloat],
                                              itemHeight: CGFloat,
                                              edgeInset: UIEdgeInsets = UIEdgeInsets.zero,
                                              topConstrainView: ConstraintView? = nil) 
```
```
        // verticalSpacing   每个view之间的垂直距离
        // horizontalSpacing 每个view之间的水平距离
        // maxWidth 是整个布局的最大宽度，需要事前传入，比如 self.view.bounds.size.width - 40
        // textWidth 是每个view的宽度，也需事前计算好
        // itemHeight 每个view的高度
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        btnArr.snp.distributeDetermineWidthViews(verticalSpacing: 20, horizontalSpacing: 10, maxWidth: self.view.bounds.size.width - 40, determineWidths: textWidth, itemHeight: 30, edgeInset: UIEdgeInsetsMake(20, 20, 0, 20), topConstrainView: label)
```

虽然说是自适应宽度，但是一开始需要自己计算每个view的宽度再传入，而且还得传最大宽度QUQ，但是除了这样，我也不知道怎么做比较好了，如果你知道，求告知。

## 九宫格布局

![九宫格布局](https://img-blog.csdn.net/20180523172045267?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3puX2VjaG9ubg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

```
    public func distributeSudokuViews(verticalSpacing: CGFloat,
                                      horizontalSpacing: CGFloat,
                                      warpCount: Int,
                                      edgeInset: UIEdgeInsets = UIEdgeInsets.zero,
                                      itemHeight: CGFloat? = nil,
                                      topConstrainView: ConstraintView? = nil)
```

第一个九宫格分布：
黄色为所有view的容器，每个view之间的边距（垂直／水平）固定，高度未知，那么其实际高度与view的容器高度有关
```
        // verticalSpacing   每个view之间的垂直距离
        // horizontalSpacing 每个view之间的水平距离
        // warpCount 每行多少列
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // itemHeight 每个view的高度， 默认为 nil，可以不指定，那么每个view的高度就按整个容器的高度来确定
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        views.snp.distributeSudokuViews(verticalSpacing: 10, horizontalSpacing: 30, warpCount: 3, edgeInset: UIEdgeInsetsMake(10, 10, 10, 10), itemHeight: nil, topConstrainView: label)
```

第二个九宫格分布：
橙色为所有view的容器，这个例子，高度确定，那么与容器的高度无关
```
		// itemHeight 每个view的高度指定
        views.snp.distributeSudokuViews(verticalSpacing: 10, horizontalSpacing: 30, warpCount: 3, edgeInset: UIEdgeInsetsMake(10, 10, 10, 10), itemHeight: 20, topConstrainView: label)
```

## 垂直布局
![垂直布局](https://img-blog.csdn.net/20180523172112515?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3puX2VjaG9ubg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

第一个垂直分布的例子，指定了按钮的高度（fixedItemLength），即每个按钮的高度都相等
```
        // axisType   垂直或水平
        // fixedItemSpacing 每个view之间的距离
        // edgeInset 整个布局的 上下左右边距，默认为 .zero
        // fixedItemLength 垂直时，是每个view的固定高度, 默认为 nil, 可不传，不传的例子见下面
        // topConstrainView 整个布局之上的view, 从topConstrainView.snp.bottom开始计算，
        // 比如,传入上面的label,则从 label.snp.bottom + edgeInset.top 开始排列， 默认为nil, 此时布局从 superview.snp.top + edgeInset.top 开始计算
        btnArr.snp.distributeViewsAlong(axisType: .vertical, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(10, 40, 0, 40), fixedItemLength: 30, topConstrainView: label)
```
当然，如果你想让它每个button的宽度不一样也可以(默认水平居中，即CenterX与superview一样)，可以遍历一遍对每个button做如下操作
```
            btn.snp.makeConstraints({ (make) in
                make.width.equalTo((i + 1) * 40)
            })
```
或者

```
		btnArr.snp.makeConstraints { (make) in
            make.width.equalTo(60)
        }
```


第二垂直分布的例子，不设置固定高度 fixedItemLength，那么随便你设置高度和宽度呗
```
	    // fixedItemLength 为nil 时， 可为每个view设置宽高，
        // 当然，也可以不设置宽度，但是对高度一些可以不设置，比如label、button
        btnArr.snp.distributeViewsAlong(axisType: .vertical, fixedItemSpacing: 30, edgeInset: UIEdgeInsetsMake(360, 20, 0, 20))
```

同理，遍历一遍对每个button做如下操作
```
 btn.snp.makeConstraints({ (make) in
                make.height.equalTo((i + 1) * 20)
                make.width.equalTo((i + 1) * 40)
            })
```
或

```
btnArr.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
```

## 水平布局
![水平布局](https://img-blog.csdn.net/20180523172135354?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3puX2VjaG9ubg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

跟垂直分布一样，只是垂直参数，换成了水平
第一个例子，设置fixedItemLength，固定宽度，但是高度还是可以设置
```
        // fixedItemLength 水平时，是每个view的固定宽度, 默认为 nil, 可不传，不传的例子见下面
        btnArr.snp.distributeViewsAlong(axisType: .horizontal, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(10, 20, 0, 20), fixedItemLength: 70, topConstrainView: label)
```
同理，遍历一遍对每个button做如下操作
```
	btn.snp.makeConstraints({ (make) in
                make.height.equalTo((i + 1) * 20)
            })
```
或者

```
        btnArr.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
```

第二个例子，不设置固定宽度 fixedItemLength，那么随便你设置高度和宽度呗

```
        // fixedItemLength 为nil 时， 可为每个view设置宽高，
        // 当然，也可以不设置宽度，但是对高度一些可以不设置，比如label、button
        btnArr.snp.distributeViewsAlong(axisType: .horizontal, fixedItemSpacing: 20, edgeInset: UIEdgeInsetsMake(360, 20, 0, 20))
```