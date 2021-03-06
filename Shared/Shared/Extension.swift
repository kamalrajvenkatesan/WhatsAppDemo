//
//  Extension.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation
import UIKit


extension UIView {

  public func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
    var topInset = CGFloat(0)
    var bottomInset = CGFloat(0)

    if #available(iOS 11, *), enableInsets {
      let insets = self.safeAreaInsets
      topInset = insets.top
      bottomInset = insets.bottom
    }

    translatesAutoresizingMaskIntoConstraints = false

    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
    }
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

  }

}

extension UITextField {
  /** Left padding */
  public func setPadding(_ leftMargin: CGFloat) {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: leftMargin, height: 0))
    self.leftViewMode = UITextFieldViewMode.always
    self.leftView = view
  }
}

extension Date {
  
  /**get date from date in 09/21/18*/
  public func getDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YY"
    let strMonth = dateFormatter.string(from: self)
    return strMonth
  }

  /**get time from date in 11:14*/
  public func getTime() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm:hh"
    let strMonth = dateFormatter.string(from: self)
    return strMonth
  }
}
