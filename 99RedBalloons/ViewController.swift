//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Samuel Hooker on 14/11/14.
//  Copyright (c) 2014 Jocus Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonBackgroundImage: UIImageView!
    @IBOutlet weak var balloonCountLabel: UILabel!
    
    var balloonList:[Balloon] = []
    var balloonIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for var i=0; i<100; i++ {
            var randomNumber = Int(arc4random_uniform(UInt32(3)))
            var balloon = Balloon()
            balloon.number = i+1
            switch randomNumber{
            case 0:
                 balloon.image = UIImage(named: "redBalloon1.jpg")
            case 1:
                 balloon.image = UIImage(named: "redBalloon2.jpg")
            case 2:
                 balloon.image = UIImage(named: "redBalloon3.jpg")
            default:
                 balloon.image = UIImage(named: "redBalloon4.jpg")
            }
            self.balloonList.append(balloon)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButtonPressed(sender: AnyObject) {
        var balloon = balloonList[self.balloonIndex]
        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.balloonBackgroundImage.image = balloon.image
            self.balloonCountLabel.text = "\(balloon.number) Red Balloons"
          
            }, completion: {
                (finished: Bool) -> () in
        })
        
        self.balloonIndex++
    
    }

}

