//
//  GeneralManager.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import UIKit

class Manager {
    class func showAlert(title: String = "",
                         message: String,
                         inViewController viewController: UIViewController,
                         completionHandler buttonCompletion:(() -> Swift.Void)?) {
        Manager.showAlert(alertTitle: title,
                          alertMessage: message,
                          inViewController: viewController,
                          withButtonTitle: "OK",
                          ofButtonType: .default,
                          completionHandler: buttonCompletion)
    }
    
    class func showAlert(alertTitle: String,
                         alertMessage: String,
                         inViewController viewController: UIViewController?,
                         withButtonTitle buttonTitle: String?,
                         ofButtonType buttonType:UIAlertAction.Style?,
                         completionHandler buttonCompletion:(() -> Swift.Void)?) {
        let alert: UIAlertController = UIAlertController(title          : alertTitle,
                                                         message        : alertMessage,
                                                         preferredStyle : .alert)
        
        if let buttonTitle = buttonTitle {
            let action: UIAlertAction = UIAlertAction(title     : buttonTitle,
                                                      style     : buttonType!,
                                                      handler   : {(action) in
                                                        if let cancel = buttonCompletion {
                                                            cancel()
                                                        }
                                                      })
            alert.addAction(action)
        }
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
}
