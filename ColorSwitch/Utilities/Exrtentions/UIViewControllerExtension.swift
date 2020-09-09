//
//  UIViewControllerExtension.swift
//  Loyalty
//
//  Created by Ihor Kramarets on 27.07.2020.
//  Copyright © 2020 Ihor Kramarets. All rights reserved.
//

import UIKit


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
