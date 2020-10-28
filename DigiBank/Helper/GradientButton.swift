//
//  GradientButton.swift
//  DigiBank
//
//  Created by priya.kashid on 27/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import UIKit

class GradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.cornerRadius = l.frame.size.height/2
        l.colors = [AppColor.appPrimaryColorMedium!.cgColor, AppColor.gradientLightShade!.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
