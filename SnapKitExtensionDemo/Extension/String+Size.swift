//
//  String+Size.swift
//  SnapKitExtensionDemo
//
//  Created by echonn on 2018/5/21.
//  Copyright © 2018年 echonn. All rights reserved.
//

import UIKit

extension String {
    func size(withFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedStringKey.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }
}
