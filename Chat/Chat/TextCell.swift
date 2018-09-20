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

  func configure(data: String) {
    self.textLabel?.text = data
  }

}
