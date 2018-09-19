//
//  ViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class ViewController: BaseTableViewController<ChatListTableViewCell, Chat> {


  override func viewDidLoad() {
    super.viewDidLoad()

    items = loadJson(type: [Chat].self, fileName: "Chat") ?? []

  }


  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

}

