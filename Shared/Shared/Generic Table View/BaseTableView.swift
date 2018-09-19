//
//  BaseTableView.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit

class BaseTableView<T: BaseTableViewCell<U>, U>: UITableView {

  var items: [U] = []

  let cellReuseId = "CellId"

  override func numberOfRows(inSection section: Int) -> Int {
    return self.items.count
  }

  override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
    
    let cell = self.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! BaseTableViewCell<U>
    cell.item = self.items[indexPath.row]

    return cell
  }

}
