//
//  SendMessageView.swift
//  Chat
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit

class SendMessageView: UIView {

  private let textField: UITextField = {
    let tf = UITextField()

    tf.textAlignment = .left
    tf.layer.cornerRadius = 20.0
    tf.layer.borderWidth = 0.5
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.clipsToBounds = true

    return tf
  }()

  private let button: UIButton = {
    let btn = UIButton()
    btn.setImage(#imageLiteral(resourceName: "Send"), for: .normal)
    btn.tintColor = UIColor.lightGray
    return btn
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)

    self.backgroundColor = .white

    button.addTarget(self, action: #selector(self.sendMessage), for: .touchUpInside) // Button action

    self.addSubview(textField)
    self.addSubview(button)

    textField.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
    button.anchor(top: topAnchor, left: textField.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 30, height: 30, enableInsets: false)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  @objc private func sendMessage() {

  }

}
