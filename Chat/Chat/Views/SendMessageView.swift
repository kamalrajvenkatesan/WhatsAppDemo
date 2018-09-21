//
//  SendMessageView.swift
//  Chat
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//
protocol SendMessageDelegate {
  func sendNewMessage(text: String?)
}

import UIKit
import Shared

class SendMessageView: UIView {

  private let textField: UITextField = {
    let tf = UITextField()

    tf.textAlignment = .left
    tf.layer.cornerRadius = 20.0
    tf.layer.borderWidth = 0.5
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.setPadding(10)
    tf.clipsToBounds = true

    return tf
  }()

  private let button: UIButton = {
    let btn = UIButton()
    btn.setImage(#imageLiteral(resourceName: "Send"), for: .normal)
    btn.tintColor = #colorLiteral(red: 0.1019999981, green: 0.451000005, blue: 0.9449999928, alpha: 1)
    return btn
  }()

  var delegate: SendMessageDelegate?


  override init(frame: CGRect) {
    super.init(frame: frame)

    self.backgroundColor = .white

    button.addTarget(self, action: #selector(self.sendMessage), for: .touchUpInside) // Button action

    self.addSubview(textField)
    self.addSubview(button)

    textField.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
    button.anchor(top: topAnchor, left: textField.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 10, paddingRight: 5, width: 30, height: 30, enableInsets: false)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  @objc private func sendMessage() {
    delegate?.sendNewMessage(text: textField.text)
    textField.text = ""
  }

}
