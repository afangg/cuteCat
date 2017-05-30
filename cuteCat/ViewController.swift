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
    var savedScore = 0
    
    var scoreDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if scoreDefaults.value(forKeyPath: "score") != nil {
            savedScore = scoreDefaults.value(forKeyPath: "score") as! Int}
        counterLabel.text = ": " + String(savedScore)
        
        view.backgroundColor = UIColor(red: 1, green: 0.65, blue: 0.65, alpha: 1)
        view.changeColor()
        
        catGif()
        let beatingArray = [#imageLiteral(resourceName: "beatingHeart1"),#imageLiteral(resourceName: "beatingHeart2")]
        counterImage.playAnimation(imageArray: beatingArray, duration: 1)
        
    }

    
    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        heartGif(sender: sender)
        playSound(file: "popSound", type: "mp3")
        
        savedScore+=1
        updateScore()
        
        if savedScore > 49 && savedScore % 50 == 0
        {
            achievement(score: savedScore)
        }
        
    }
    
    @IBAction func reset(_ sender: Any)
    {
        savedScore = 0
        updateScore()
    }
    
    func heartGif(sender: UITapGestureRecognizer)
    {
        let size = Int(arc4random_uniform(200)+50)
        let heartImageView = UIImageView(
            frame: CGRect(x: Int(sender.location(in: view).x)-(size/2), y: Int(sender.location(in: view).y)-(size/2), width: size, height: size))
        heartImageView.sizeThatFits(#imageLiteral(resourceName: "heart1").size)
        self.view.addSubview(heartImageView)
        
        let heartArray = [#imageLiteral(resourceName: "heart1"),#imageLiteral(resourceName: "heart1b"),#imageLiteral(resourceName: "heart2"),#imageLiteral(resourceName: "heart3"),#imageLiteral(resourceName: "heart4"),#imageLiteral(resourceName: "heart5"),#imageLiteral(resourceName: "heart6"),#imageLiteral(resourceName: "heart7"),#imageLiteral(resourceName: "heart8"),#imageLiteral(resourceName: "heart9"),#imageLiteral(resourceName: "heart10"),#imageLiteral(resourceName: "heart11")]
        heartImageView.playAnimation(imageArray: heartArray, duration: 0.75, repeatAnimate: 1)
    }
    func catGif()
    {
        let catArray = [#imageLiteral(resourceName: "cuteCat-1"),#imageLiteral(resourceName: "cuteCat-2"),#imageLiteral(resourceName: "cuteCat-3"),#imageLiteral(resourceName: "cuteCat-4"),#imageLiteral(resourceName: "cuteCat-5"),#imageLiteral(resourceName: "cuteCat-6"),#imageLiteral(resourceName: "cuteCat-7"),#imageLiteral(resourceName: "cuteCat-8"),#imageLiteral(resourceName: "cuteCat-9"),#imageLiteral(resourceName: "cuteCat-10"),#imageLiteral(resourceName: "cuteCat-11"),#imageLiteral(resourceName: "cuteCat-12")]
        imageView.playAnimation(imageArray: catArray, duration: 1)
        
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
    
    func updateScore()
    {
        scoreDefaults.set(savedScore, forKey: "score")
        counterLabel.text = ": " + String(savedScore)
    }
    func achievement(score: Int)
    {
        
        let popUp = UIAlertController(title: "Achievment Unlocked", message: "You made it to " + String(score), preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cool", style: .cancel, handler: nil)
        popUp.addAction(cancel)
        popUp.popoverPresentationController?.sourceView = self.view
        popUp.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        
        present(popUp, animated: true, completion: nil)
    }
}

