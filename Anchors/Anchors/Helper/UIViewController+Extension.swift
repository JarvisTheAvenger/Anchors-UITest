//
//  UIStoryboard+Extension.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import UIKit

extension UIViewController {
     class var storyboardID : String {
         return "\(self)"
     }
     
    @discardableResult
    static func instantiate(_ appStoryboard: StoryBoard, identifier : String = "") -> Self {
        return appStoryboard.viewcontroller(self, identifier)
    }
}

enum StoryBoard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewcontroller <T: UIViewController> (_ viewcontrollerClass: T.Type, _ identfier : String = "") -> T {
        var storyboardID = (viewcontrollerClass as UIViewController.Type).storyboardID
        if !identfier.isEmpty {
            storyboardID = identfier
        }
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
