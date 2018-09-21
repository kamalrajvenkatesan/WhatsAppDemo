//
//  ContactCell.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 21/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class ContactCell: BaseTableViewCell<ContactModel> {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  override var item: ContactModel! {
    didSet {
      self.detailTextLabel?.text = item.phoneNumber
      self.textLabel?.text = item.name
    }
  }

}
