//
//  Extentions.swift
//  swift-essentials
//
//  Created by Nitesh  on 01/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// Autolayout Axis Anchors
    /// - Parameters:
    ///   - top: Top
    ///   - left: Left
    ///   - bottom: Bottom
    ///   - right: Right
    ///   - paddingTop: Padding Top
    ///   - paddingLeft: Padding Left
    ///   - paddingBottom: Padding Bottom
    ///   - paddingRight: Padding Right
    ///   - width: Width
    ///   - height: Height
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension ViewController {
    func showToast(message: String) {
        let label = UILabel(frame: CGRect(x: self.view.frame.width/2-75,
                                          y: self.view.frame.height - 100,
                                          width: 150, height: 44))
        label.textAlignment = .center
        label.backgroundColor = .label.withAlphaComponent(0.5)
        label.textColor = .systemBackground
        label.alpha = 1.0
        label.text = message
        label.clipsToBounds = true
        self.view.addSubview(label)
        
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseInOut) {
            label.alpha = 0.0
        } completion: { success in
            label.removeFromSuperview()
        }
    }
}

