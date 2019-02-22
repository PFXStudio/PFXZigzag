//
//  ViewController.swift
//  PFXZigzag
//
//  Created by PFXStudio on 2019. 2. 21..
//  Copyright © 2019년 PFXStudio. All rights reserved.
//

import UIKit
import SwiftProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var legalButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var autoLoginLegalButton: UIButton!

    @IBOutlet weak var legalButtonHeightLayoutConstraint: NSLayoutConstraint!

    @IBOutlet weak var autoLoginLegalButtonHeightLayoutConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        UserDefaults.standard.removeObject(forKey: DefineStrings.kAgreedAutoLogin)
    }
    
    override func viewWillLayoutSubviews() {
        self.loadingIndicatorView.isHidden = true

        let frame = self.legalButton.frame
        let edge = self.legalButton.imageEdgeInsets
        self.legalButton.imageEdgeInsets = UIEdgeInsets(top: edge.top, left: frame.width - 44, bottom: edge.bottom, right: edge.right)
    }
    
    func updateAutoLoginLegalViews() {
        let kButtonHeight: CGFloat = 44
        let kAnimationDuration = 0.2
        if let _ = UserDefaults.standard.string(forKey: DefineStrings.kAgreedAutoLogin) {
            UIView.animate(withDuration: kAnimationDuration) {
                self.autoLoginLegalButtonHeightLayoutConstraint.constant = kButtonHeight
                self.legalButtonHeightLayoutConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
            
            return
        }
        
        UIView.animate(withDuration: kAnimationDuration) {
            self.autoLoginLegalButtonHeightLayoutConstraint.constant = 0
            self.legalButtonHeightLayoutConstraint.constant = kButtonHeight
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func touchedLegalButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }

        button.isSelected = !button.isSelected
    }
    
    @IBAction func touchedLoginButton(_ sender: Any) {
        guard let account = self.accountTextField.text else {
            return
        }
        
        guard let password = self.passwordTextField.text else {
            return
        }

        self.initializeLoginViews(enabled: false)
        self.statusLabel.text = NSLocalizedString("logingStatusTitle", comment: "")
        self.detailLabel.text = ""
        self.requestLogin(account: account, password: password) { (dict, error) in
            self.initializeLoginViews(enabled: true)
            self.statusLabel.text = NSLocalizedString("loginedStatusTitle", comment: "")
            
            if self.legalButton.isSelected == true {
                UserDefaults.standard.setValue(DefineStrings.kAgreedAutoLogin, forKey: DefineStrings.kAgreedAutoLogin)
            }
            else {
                UserDefaults.standard.removeObject(forKey: DefineStrings.kAgreedAutoLogin)
            }
            
            self.updateAutoLoginLegalViews()
        }
    }
    
    func initializeLoginViews(enabled: Bool) {
        self.loadingIndicatorView.isHidden = enabled
        self.accountTextField.isEnabled = enabled
        self.passwordTextField.isEnabled = enabled
        self.legalButton.isEnabled = enabled
        self.loginButton.isEnabled = enabled
        self.findButton.isEnabled = enabled
        self.autoLoginLegalButton.isEnabled = enabled
    }

    func requestLogin(account: String, password: String, completion: @escaping ((NSDictionary?, NSError?) -> Void)) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) { [weak self] in
            
            DispatchQueue.main.sync {
                completion(nil, nil)
            }
        }
    }
    
    @IBAction func touchedFindButton(_ sender: Any) {
        
    }
    
    @IBAction func touchedAutoLoginLegalButton(_ sender: Any) {
        
    }
    
}

