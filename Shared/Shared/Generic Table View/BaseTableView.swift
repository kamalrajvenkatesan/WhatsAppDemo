//
//  BaseTableView.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
/** Generic table view, Associated with Base Table view cell*/
public class BaseTableView<T: BaseTableViewCell<M>, M>: UITableView {

  public var items: [M] = [] {
    didSet {
      self.reloadData()
    }
  }

  let cellReuseId = "CellId"

  public override func awakeFromNib() {
    super.awakeFromNib()

    self.register(T.self, forCellReuseIdentifier: cellReuseId)
  }

  override public func numberOfRows(inSection section: Int) -> Int {
    return self.items.count
  }

  override public func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
    
    let cell = self.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! BaseTableViewCell<M>
    cell.item = self.items[indexPath.row]

    return cell
  }

}

