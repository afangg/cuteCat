//
//  UIView+rgbFade.swift
//  designExtensions
//
//  Created by Alisha Fong on 5/11/17.
//  Copyright © 2017 Alisha Fong. All rights reserved.
//

import UIKit

extension UIView
{
    
    func changeColor()
    {
        var timeAction = Timer.scheduledTimer(timeInterval: 00.1, target: self, selector: #selector(UIView.increaseColor), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func increaseColor()
    {
        var tempColor = CIColor(color: self.backgroundColor!)
        
        var tempRed = Int(tempColor.red*255)
        var tempGreen = Int(tempColor.green*255)
        var tempBlue = Int(tempColor.blue*255)
        
        
        if tempRed == 255 && tempGreen < 255 && tempBlue == 165{
            tempGreen += 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
        else if tempRed > 165 && tempGreen == 255 && tempBlue == 165
        {
            tempRed -= 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
            
        else if tempRed == 165 && tempGreen == 255 && tempBlue < 255
        {
            tempBlue += 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
        else if tempRed == 165 && tempGreen > 165 && tempBlue == 255
        {
            tempGreen -= 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
        else if tempRed < 255 && tempGreen == 165 && tempBlue == 255
        {
            tempRed += 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
        else if tempRed == 255 && tempGreen == 165 && tempBlue > 165
        {
            tempBlue -= 2
            assignColors(red: tempRed, green: tempGreen, blue: tempBlue)
        }
        
        
    }
    
    func assignColors(red: Int, green: Int, blue: Int)
    {
        self.backgroundColor = UIColor(red: CGFloat(Double(red)/255), green: CGFloat(Double(green)/255), blue: CGFloat(Double(blue)/255), alpha: 1)
    }
    
    
}


