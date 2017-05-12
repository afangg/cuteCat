//
//  UIImageView+animate.swift
//  designExtensions
//
//  Created by Alisha Fong on 5/11/17.
//  Copyright © 2017 Alisha Fong. All rights reserved.
//

import UIKit

extension UIImageView
{
    func playAnimation(imageArray: [UIImage], duration: Double, repeatAnimate: Int)
    {
        self.animationImages = imageArray
        self.animationDuration = duration
        self.animationRepeatCount = repeatAnimate
        
        self.startAnimating()
    }
    func playAnimation(imageArray: [UIImage], duration: Double)
    {
        self.animationImages = imageArray
        self.animationDuration = duration
        
        self.startAnimating()
    }
}
