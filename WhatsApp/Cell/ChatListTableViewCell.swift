//
//  ChatListTableViewCell.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class ChatListTableViewCell: BaseTableViewCell<ChatListModel> {

  private let avatarView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .black
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


  private let timeLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .lightGray
    lbl.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    lbl.textAlignment = .left
    return lbl
  }()

  private let messageLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .lightGray
    lbl.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    lbl.numberOfLines = 2
    lbl.textAlignment = .left
    return lbl
  }()

  override var item: ChatListModel! {
    didSet {
      nameLabel.text = "item.name"
      timeLabel.text = "item.time"
      messageLabel.text = "item.message"
    }
  }


  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    accessoryType = .disclosureIndicator
    selectionStyle = .none

    self.addSubview(avatarView)
    self.addSubview(nameLabel)
    self.addSubview(timeLabel)
    self.addSubview(messageLabel)

    avatarView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 50, height: 50, enableInsets: false)

    avatarView.layer.cornerRadius = 25.0

    nameLabel.anchor(top: topAnchor, left: avatarView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 0, height: 0, enableInsets: false)

    timeLabel.anchor(top: topAnchor, left: nameLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 0, height: 0, enableInsets: false)

    messageLabel.anchor(top: nameLabel.bottomAnchor, left: avatarView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 30, width: 0, height: 0, enableInsets: false)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }


}

