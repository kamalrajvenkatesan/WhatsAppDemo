//
//  TextCell.swift
//  Chat
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class TextCell: UITableViewCell, ConfigurableCell {

  private let containerView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 10.0

    return view
  }()

  private let messageLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    label.textColor = .black
    label.numberOfLines = 0
    return label
  }()

  private let timeLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    label.textColor = .lightGray
    return label
  }()

  var leftConstraint: NSLayoutConstraint?
  var trailingConstraint: NSLayoutConstraint?

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.selectionStyle = .none // remove selection

    self.backgroundColor = UIColor.clear

    self.addSubview(containerView)
    self.containerView.addSubview(messageLabel)
    self.containerView.addSubview(timeLabel)

    // Constraint
    containerView.translatesAutoresizingMaskIntoConstraints = false
    leftConstraint = containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
    leftConstraint?.isActive = true
    trailingConstraint = containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
    trailingConstraint?.isActive = true

    containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true


    messageLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0, enableInsets: false)

    timeLabel.anchor(top: messageLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }


  func configure(data: MessageModel) {
    self.messageLabel.text = data.message
    self.timeLabel.text = "Today"

    self.containerView.backgroundColor = (data.isSent) ? #colorLiteral(red: 0.8270000219, green: 0.976000011, blue: 0.7179999948, alpha: 1) : .white

    self.move(isSent: data.isSent)
  }

  func move(isSent: Bool) {
    self.leftConstraint?.isActive = false
    leftConstraint = containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: (isSent ? 60 : 10))
    leftConstraint?.isActive = true

    self.trailingConstraint?.isActive = false
    trailingConstraint = containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: (isSent ? -10 : -80) )
    trailingConstraint?.isActive = true
  }
}
