//
//  Level1Controller.swift
//  SwyftSwype
//
//  Created by Nishan D'Souza on 2/13/16.
//  Copyright © 2016 Nishan D'Souza. All rights reserved.
//

import Foundation
import UIKit;

class Level1Controller : UIViewController {
    
    @IBOutlet weak var output: UILabel!
    var colorNum = 0;
    var autoCC = false;
    var interval:Double = 2;
    var time = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.text = "";
        // Do any additional setup after loading the view, typically from a nib.
        var swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(Level1Controller.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(Level1Controller.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(Level1Controller.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(Level1Controller.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        game()
    }
    
    func game() {
        interval = interval - 0.12
        if(autoCC == false) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(interval, target:self, selector: "runLevel",userInfo: nil,repeats: false)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
                if(self.view.backgroundColor == UIColor.redColor()) {
                    self.view.backgroundColor = UIColor.whiteColor()
                    self.output.text = "Correct!";
                    
                }
                else {
                    print("Error")
                    var endTimer = NSTimer.scheduledTimerWithTimeInterval(4, target:self, selector:"endGame", userInfo:nil,repeats:false)
                    self.output.text = ""
                    let levelVC = self.storyboard?.instantiateViewControllerWithIdentifier("LevelController") as! LevelController
                    self.navigationController?.pushViewController(levelVC, animated: true)
                }
            case UISwipeGestureRecognizerDirection.Down:
                print("Swiped down")
                if(self.view.backgroundColor == UIColor.greenColor()) {
                    self.view.backgroundColor = UIColor.whiteColor()
                    self.output.text = "Correct!";
                }
                else {
                    print("Error")
                    var endTimer = NSTimer.scheduledTimerWithTimeInterval(4, target:self, selector:"endGame", userInfo:nil,repeats:false)
                    self.output.text = ""
                    let levelVC = self.storyboard?.instantiateViewControllerWithIdentifier("LevelController") as! LevelController
                    self.navigationController?.pushViewController(levelVC, animated: true)
                }
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped left")
                if(self.view.backgroundColor == UIColor.yellowColor()) {
                    self.view.backgroundColor = UIColor.whiteColor()
                    self.output.text = "Correct!";
                    if(colorNum == 11) {
                        var winTimer = NSTimer.scheduledTimerWithTimeInterval(4, target:self, selector: "winGame", userInfo: nil, repeats: false)
                        self.output.text = ""
                        let levelVC = self.storyboard?.instantiateViewControllerWithIdentifier("LevelController") as! LevelController
                        self.navigationController?.pushViewController(levelVC, animated: true)
                    }
                }
                else {
                    print("Error")
                    var endTimer = NSTimer.scheduledTimerWithTimeInterval(4, target:self, selector:"endGame", userInfo:nil,repeats:false)
                    self.output.text = ""
                    let levelVC = self.storyboard?.instantiateViewControllerWithIdentifier("LevelController") as! LevelController
                    self.navigationController?.pushViewController(levelVC, animated: true)
                }
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
                if(self.view.backgroundColor == UIColor.blueColor()) {
                    self.view.backgroundColor = UIColor.whiteColor()
                    self.output.text = "Correct!";
                    
                }
                else {
                    print("Error")
                    var endTimer = NSTimer.scheduledTimerWithTimeInterval(4, target:self, selector:"endGame", userInfo:nil,repeats:false)
                    self.output.text = ""
                    let levelVC = self.storyboard?.instantiateViewControllerWithIdentifier("LevelController") as! LevelController
                    self.navigationController?.pushViewController(levelVC, animated: true)
                }
            default:break
            }
        }
    }
    /*
    red = right
    yellow = left
    blue = up
    green = down
*/
    func changeColor() {
        switch(colorNum) {
        case 0: self.view.backgroundColor = UIColor.blueColor()
            self.output.text = "";
        break;
        case 1: self.view.backgroundColor = UIColor.redColor()
            self.output.text = "";
        break;
        case 2: self.view.backgroundColor = UIColor.greenColor()
            self.output.text = "";
        break;
        case 3: self.view.backgroundColor = UIColor.yellowColor()
            self.output.text = "";
            break;
        case 4: self.view.backgroundColor = UIColor.redColor()
            self.output.text = "";
            break;
        case 5: self.view.backgroundColor = UIColor.blueColor()
            self.output.text = "";
            break;
        case 6: self.view.backgroundColor = UIColor.redColor()
            self.output.text = "";
            break;
        case 7: self.view.backgroundColor = UIColor.greenColor()
            self.output.text = "";
            break;
        case 8: self.view.backgroundColor = UIColor.blueColor()
            self.output.text = "";
            break;
        case 9: self.view.backgroundColor = UIColor.yellowColor()
            self.output.text = "";
            break;
        case 10: self.view.backgroundColor = UIColor.blueColor()
            self.output.text = "";
            break;
        case 11: self.view.backgroundColor = UIColor.yellowColor()
            self.output.text = "";
            break;
            
        default: break;
        }
        colorNum += 1
    }
    
    func runLevel() {
        changeColor()
        viewDidLoad()
    }
    func endGame() {
        self.output.text = "You failed! Try again"
    }
    func winGame() {
        self.output.text = "You win!"
    }
}
