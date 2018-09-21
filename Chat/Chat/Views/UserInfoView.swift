//
//  UserInfoView.swift
//  Chat
//
//  Created by kamalraj venkatesan on 21/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class UserInfoView: UIView {

  private let avatarView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    return imageView
  }()

  private let nameLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.boldSystemFont(ofSize: 16)
    lbl.textAlignment = .left
    return lbl
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  convenience init(userImage: String?, name: String, frame: CGRect) {
    self.init(frame: frame)

    self.avatarView.image = #imageLiteral(resourceName: "user.png")
    self.nameLabel.text = name
  }

  /** Will add view and setup constraints */
  private func setup() {
    self.addSubview(avatarView)
    self.addSubview(nameLabel)

    self.avatarView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 30, height: 30, enableInsets: false)
    self.nameLabel.anchor(top: topAnchor, left: avatarView.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)

  }

}
