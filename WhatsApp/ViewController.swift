//
//  ViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared
import Chat

class ViewController: BaseTableViewController<ChatListTableViewCell, Chat> {


  override func viewDidLoad() {
    super.viewDidLoad()

    // Search bar
    let searchBar = UISearchController(searchResultsController: nil)
    self.navigationItem.searchController = searchBar

    items = loadJson(type: [Chat].self, fileName: "Chat") ?? []

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.navigationController?.navigationBar.prefersLargeTitles = true
  }


  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = ChatViewController()

    self.navigationController?.pushViewController(vc, animated: true)
    
  }

}
