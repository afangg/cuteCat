//
//  gifs.swift
//  cuteCat
//
//  Created by student5 on 6/2/17.
//  Copyright © 2017 Alisha Fong. All rights reserved.
//

import UIKit

func heartGif(sender: UITapGestureRecognizer, view: UIView)
{
    let size = Int(arc4random_uniform(200)+50)
    let heartImageView = UIImageView(
        frame: CGRect(x: Int(sender.location(in: view).x)-(size/2), y: Int(sender.location(in: view).y)-(size/2), width: size, height: size))
    heartImageView.sizeThatFits(#imageLiteral(resourceName: "heart1").size)
    view.addSubview(heartImageView)
    
    let heartArray = [#imageLiteral(resourceName: "heart1"),#imageLiteral(resourceName: "heart1b"),#imageLiteral(resourceName: "heart2"),#imageLiteral(resourceName: "heart3"),#imageLiteral(resourceName: "heart4"),#imageLiteral(resourceName: "heart5"),#imageLiteral(resourceName: "heart6"),#imageLiteral(resourceName: "heart7"),#imageLiteral(resourceName: "heart8"),#imageLiteral(resourceName: "heart9"),#imageLiteral(resourceName: "heart10"),#imageLiteral(resourceName: "heart11")]
    heartImageView.playAnimation(imageArray: heartArray, duration: 0.75, repeatAnimate: 1)
}
func catGif(imageView: UIImageView)
{
    let catArray = [#imageLiteral(resourceName: "cuteCat-1"),#imageLiteral(resourceName: "cuteCat-2"),#imageLiteral(resourceName: "cuteCat-3"),#imageLiteral(resourceName: "cuteCat-4"),#imageLiteral(resourceName: "cuteCat-5"),#imageLiteral(resourceName: "cuteCat-6"),#imageLiteral(resourceName: "cuteCat-7"),#imageLiteral(resourceName: "cuteCat-8"),#imageLiteral(resourceName: "cuteCat-9"),#imageLiteral(resourceName: "cuteCat-10"),#imageLiteral(resourceName: "cuteCat-11"),#imageLiteral(resourceName: "cuteCat-12")]
    imageView.playAnimation(imageArray: catArray, duration: 1)
    
}
