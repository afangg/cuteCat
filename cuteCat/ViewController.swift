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
    var achievementPoints = 0
    
    var scoreDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if scoreDefaults.value(forKeyPath: "score") != nil && scoreDefaults.value(forKeyPath: "achievement") != nil
        {
            savedScore = scoreDefaults.value(forKeyPath: "score") as! Int
            achievementPoints = scoreDefaults.value(forKeyPath: "achievement") as! Int
        }
        counterLabel.text = ": " + String(savedScore)
        
        view.backgroundColor = UIColor(red: 1, green: 0.65, blue: 0.65, alpha: 1)
        view.changeColor()
        
        catGif(imageView: imageView)
        let beatingArray = [#imageLiteral(resourceName: "beatingHeart1"),#imageLiteral(resourceName: "beatingHeart2")]
        counterImage.playAnimation(imageArray: beatingArray, duration: 1)
        
    }

    
    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        heartGif(sender: sender, view: view)
        playSound(file: "popSound", type: "mp3")
        
        savedScore+=1
        updateScore()
        
        if achievementPoints < savedScore
        {
        achievementPoints = savedScore/100
        }
        
        if savedScore > 99 && savedScore % 100 == 0
        {
            achievement(score: savedScore)
        }
        
    }
    
    @IBAction func reset(_ sender: Any)
    {
        savedScore = 0
        updateScore()
        print(savedScore)
    }
    
    @IBAction func jump(_ sender: Any)
    {
        savedScore += 99
        updateScore()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! achieveVC
        if achievementPoints > destinationViewController.total
        {
            destinationViewController.total = achievementPoints-1
        }
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
        scoreDefaults.set(achievementPoints, forKey: "achievements")
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

