//
//  ViewController.swift
//  projectA
//
//  Created by Alisha Fong on 5/7/17.
//  Copyright © 2017 Alisha Fong. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var counterImage: UIImageView!
    @IBOutlet var counterLabel: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    var timeAction = Timer()
    var counter = 0
    
    var bgColor = UIColor(red: 1, green: 0.65, blue: 0.65, alpha: 1)
    var color = CIColor()
    var red = 0
    var green = 0
    var blue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = CIColor(color: bgColor)
        red = Int(color.red * 255.0); green = Int(color.green * 255.0); blue = Int(color.blue * 255.0)
        changeColor()
        
        catGif()
        var beatingArray = [#imageLiteral(resourceName: "beatingHeart1"),#imageLiteral(resourceName: "beatingHeart2")]
        playAnimation(imageView: counterImage, imageArray: beatingArray, duration: 1)
        
        
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        heartGif(sender: sender)
        playSound(file: "popSound", type: "mp3")
        counter+=1
        counterLabel.text = ": " + String(counter)
        
    }
    
    func heartGif(sender: UITapGestureRecognizer)
    {
        let size = Int(arc4random_uniform(200)+50)
        let heartImageView = UIImageView(frame: CGRect(origin: sender.location(in: view), size: CGSize(width: size, height: size)))
        heartImageView.center = sender.location(in: view)
        heartImageView.sizeThatFits(#imageLiteral(resourceName: "heart1").size)
        self.view.addSubview(heartImageView)
        
        var heartArray = [#imageLiteral(resourceName: "heart1"),#imageLiteral(resourceName: "heart1b"),#imageLiteral(resourceName: "heart2"),#imageLiteral(resourceName: "heart3"),#imageLiteral(resourceName: "heart4"),#imageLiteral(resourceName: "heart5"),#imageLiteral(resourceName: "heart6"),#imageLiteral(resourceName: "heart7"),#imageLiteral(resourceName: "heart8"),#imageLiteral(resourceName: "heart9"),#imageLiteral(resourceName: "heart10"),#imageLiteral(resourceName: "heart11")]
        playAnimation(imageView: heartImageView, imageArray: heartArray, duration: 0.75, repeatAnimate: 1)
    }
    func catGif()
    {
        var catArray = [#imageLiteral(resourceName: "cuteCat-1"),#imageLiteral(resourceName: "cuteCat-2"),#imageLiteral(resourceName: "cuteCat-3"),#imageLiteral(resourceName: "cuteCat-4"),#imageLiteral(resourceName: "cuteCat-5"),#imageLiteral(resourceName: "cuteCat-6"),#imageLiteral(resourceName: "cuteCat-7"),#imageLiteral(resourceName: "cuteCat-8"),#imageLiteral(resourceName: "cuteCat-9"),#imageLiteral(resourceName: "cuteCat-10"),#imageLiteral(resourceName: "cuteCat-11"),#imageLiteral(resourceName: "cuteCat-12")]
        
        playAnimation(imageView: imageView, imageArray: catArray, duration: 1)

        
    }
    
    func playAnimation(imageView: UIImageView, imageArray: [UIImage], duration: Double, repeatAnimate: Int)
    {
        imageView.animationImages = imageArray
        imageView.animationDuration = duration
        imageView.animationRepeatCount = repeatAnimate
        
        imageView.startAnimating()
    }
    func playAnimation(imageView: UIImageView, imageArray: [UIImage], duration: Double)
    {
        imageView.animationImages = imageArray
        imageView.animationDuration = duration
        
        imageView.startAnimating()
    }
    
    func playSound(file: NSString, type: NSString){
        let path = Bundle.main.path(forResource: file as String, ofType: type as String)
        let url = NSURL.fileURL(withPath: path!)
        do {
            try  audioPlayer =  AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        }
        catch { print("Player not available") }
    }
    
    
    
    func changeColor()
    {
        bgColor = UIColor(red: 1, green: 0.65, blue: 0.65, alpha: 1)
        timeAction = Timer.scheduledTimer(timeInterval: 00.1, target: self, selector: #selector(ViewController.increaseColor), userInfo: nil, repeats: true)
        
    }
    
    func increaseColor()
    {
        if red == 255 && green < 255 && blue == 165{
            green += 2
            assignColors()
        }
        else if red > 165 && green == 255 && blue == 165
        {
            red -= 2
            assignColors()
        }
            
        else if red == 165 && green == 255 && blue < 255
        {
            blue += 2
            assignColors()
        }
        else if red == 165 && green > 165 && blue == 255
        {
            green -= 2
            assignColors()
        }
        else if red < 255 && green == 165 && blue == 255
        {
            red += 2
            assignColors()
        }
        else if red == 255 && green == 165 && blue > 165
        {
            blue -= 2
            assignColors()
        }
        
        view.backgroundColor = bgColor
        
        
    }
    
    func assignColors()
    {
        bgColor = UIColor(red: CGFloat(Double(red)/255), green: CGFloat(Double(green)/255), blue: CGFloat(Double(blue)/255), alpha: 1)
    }
    
    
}

