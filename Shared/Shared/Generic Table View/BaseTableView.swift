//
//  BaseTableView.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit

public class BaseTableView<T: BaseTableViewCell<U>, U>: UITableView {

  public var items: [U] = []

  let cellReuseId = "CellId"

  override public func numberOfRows(inSection section: Int) -> Int {
    return self.items.count
  }

  override public func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
    
    let cell = self.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! BaseTableViewCell<U>
    cell.item = self.items[indexPath.row]

    return cell
  }

}
