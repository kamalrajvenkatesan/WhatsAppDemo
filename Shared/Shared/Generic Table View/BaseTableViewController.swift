//
//  BaseTableViewController.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit

open class BaseTableViewController<T: BaseTableViewCell<M>, M>: UITableViewController {

  /** Data that should be listed*/
  open var items = [M]()

  let cellReuseId = "ChatListTableViewCell"

  override open func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(T.self, forCellReuseIdentifier: cellReuseId) // Resgitering cell
  }

  override open func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source
  override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return self.items.count
  }

  open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! BaseTableViewCell<M>
    cell.item = self.items[indexPath.row]

    return cell
  }



}
