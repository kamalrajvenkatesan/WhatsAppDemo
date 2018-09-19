//
//  ViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared

class ViewController: BaseTableViewController<ChatListTableViewCell, ChatList> {


  override func viewDidLoad() {
    super.viewDidLoad()

    items = [
      ChatList(data: "Kamal"),
      ChatList(data: "Raj"),
      ChatList(data: "Manjula")
    ]
  }


}

