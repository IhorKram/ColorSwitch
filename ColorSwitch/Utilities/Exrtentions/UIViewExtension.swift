//
//  UIViewExtension.swift
//  Loyalty
//
//  Created by Ihor Kramarets on 27.07.2020.
//  Copyright © 2020 Ihor Kramarets. All rights reserved.
//

import UIKit


extension UIView {
    func setBlurBackgroundView() {
            let visualEffectView = UIVisualEffectView()
            visualEffectView.layer.cornerRadius = 7.0
            visualEffectView.clipsToBounds = true
            visualEffectView.backgroundColor = .clear
            self.addSubview(visualEffectView)
            visualEffectView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            visualEffectView.contentView.addSubview(blurEffectView)
            blurEffectView.setAnchor(top: visualEffectView.topAnchor, left: visualEffectView.leftAnchor, bottom: visualEffectView.bottomAnchor, right: visualEffectView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
        
        
        func addDashedBorder(width: CGFloat, height: CGFloat) {
            let shapeLayer:CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: width, height: height)
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: width/2, y: height/2)
            shapeLayer.fillColor = nil//UIColor.clear.cgColor
            shapeLayer.strokeColor = UIColor.akcentColor().cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            shapeLayer.lineDashPattern = [5,5]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 8).cgPath
            self.layer.addSublayer(shapeLayer)
        }

        
        
        
        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView.dismissKeyboard))
            tap.cancelsTouchesInView = false
            self.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            self.endEditing(true)
        }

        
        
        

        
        func setCustomGradientBackground(colorOne: UIColor, colorTwo: UIColor, startPoint: CGPoint, endPoint: CGPoint, location: [NSNumber]) {
                let gradient = CAGradientLayer()
                gradient.frame = bounds
                clipsToBounds = true
    //            layer.masksToBounds = true
                gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
                gradient.locations = location
                gradient.startPoint = startPoint
                gradient.endPoint = endPoint
                gradient.type = .axial
                print(gradient.frame)
                layer.insertSublayer(gradient, at: 0)
            }
        func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            clipsToBounds = true
    //        layer.masksToBounds = true
            gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.type = .axial
            print(gradient.frame)
            layer.insertSublayer(gradient, at: 0)
        }
        
        func addCustomShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 1.0, offset: CGSize) {
            switch location {
            case .bottom:
                // ofset: CGSize(width: 0, height: 10)
                 addShadow(offset: offset, color: color, opacity: opacity, radius: radius)
            case .top:
                // ofset: CGSize(width: 0, height: -2)
                addShadow(offset: offset, color: color, opacity: opacity, radius: radius)
            }
        }
        func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = offset
            self.layer.shadowOpacity = opacity
            self.layer.shadowRadius = radius
        }
        enum VerticalLocation: String {
            case bottom
            case top
        }
        
        
        func setShadow() {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.4
            layer.shadowOffset = .init(width: 0, height: 2)
            layer.shadowRadius = 4
        }
        func setGreenShadow() {
            layer.masksToBounds = false
            layer.shadowColor = UIColor(red: 0, green: 103, blue: 0, alpha: 1).cgColor
            layer.shadowOpacity = 0.7//0.2
            layer.shadowOffset = .init(width: 0, height: 2)
            layer.shadowRadius = 4
        }
        func setCustomeCornerRadius(radius: CGFloat) {
                layer.cornerRadius = radius
                layer.masksToBounds = true
            }
        func setStandartCornerRadius() {
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }
        func setCornerRadius() {
            layer.cornerRadius = self.frame.height / 2
    //        layer.cornerRadius = 25//10
            layer.masksToBounds = true
        }
        
        
        func setAnchorCenterXY(mainView: UIView, width: CGFloat = 0, height: CGFloat = 0) {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
            if width != 0 {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            if height != 0 {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        
        func setAnchorWidthAndHeight(width: CGFloat = 0, height: CGFloat = 0) {
            self.translatesAutoresizingMaskIntoConstraints = false
            if width != 0 {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            if height != 0 {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        func setAnchorFill(mainView: UIView) {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
            self.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
            self.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        }
        
        func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
            
            self.translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
            }
            
            if let left = left {
                self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            }
            
            if let bottom = bottom {
                self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
            
            if let right = right {
                self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
            
            if width != 0 {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            
            if height != 0 {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        var safeTopAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.topAnchor
            }
            return topAnchor
        }
        
        var safeLeftAnchor: NSLayoutXAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.leftAnchor
            }
            return leftAnchor
        }
        
        var safeBottomAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.bottomAnchor
            }
            return bottomAnchor
        }
        
        var safeRightAnchor: NSLayoutXAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.rightAnchor
            }
            return rightAnchor
        }
}
