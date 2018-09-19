//
//  ChatListTableViewCell.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class ChatListTableViewCell: BaseTableViewCell<Chat> {

  override var item: Chat! {
    didSet {
      self.textLabel?.text = item._id
    }
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
