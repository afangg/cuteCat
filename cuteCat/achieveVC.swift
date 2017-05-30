//
//  achieveVC.swift
//  cuteCat
//
//  Created by student5 on 5/30/17.
//  Copyright © 2017 Alisha Fong. All rights reserved.
//

import UIKit

class achieveVC: UIViewController {

    @IBOutlet weak var food1: UIImageView!
    @IBOutlet weak var food2: UIImageView!
    @IBOutlet weak var food3: UIImageView!
    @IBOutlet weak var food4: UIImageView!
    @IBOutlet weak var food5: UIImageView!
    @IBOutlet weak var food6: UIImageView!
    @IBOutlet weak var food7: UIImageView!
    @IBOutlet weak var food8: UIImageView!
    @IBOutlet weak var food9: UIImageView!
    @IBOutlet weak var food10: UIImageView!
    @IBOutlet weak var food11: UIImageView!
    @IBOutlet weak var food12: UIImageView!
    @IBOutlet weak var food13: UIImageView!
    @IBOutlet weak var food14: UIImageView!
    @IBOutlet weak var food15: UIImageView!
    @IBOutlet weak var food16: UIImageView!
    @IBOutlet weak var food17: UIImageView!
    @IBOutlet weak var food18: UIImageView!
    @IBOutlet weak var food19: UIImageView!
    @IBOutlet weak var food20: UIImageView!
    
    var imageArray = [UIImageView]()
    var pictureArray = [UIImage]()
    
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [food1,food2,food3,food4,food5,food6,food7,food8,food9,food10,food11,food12,food13,food14,food15,food16,food17,food18,food19,food20]
        
        p
        
        for index in 0...total
        {
            imageArray[index].image =
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }

}
