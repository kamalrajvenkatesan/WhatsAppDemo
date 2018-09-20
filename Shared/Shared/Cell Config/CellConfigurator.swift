//
//  CellConfigurator.swift
//  Shared
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

public protocol ConfigurableCell {
  associatedtype U // Data type
  func configure(data: U)
}

public protocol CellConfigurator {
  static var reuseId: String { get }
  func configure(cell: UIView)
}


public class TableCellConfigurator<T: ConfigurableCell, U>: CellConfigurator where T.U == U, T: UITableViewCell {

  public static var reuseId: String { return String(describing: T.self) }

  public let item: U

  public init(item: U) {
    self.item = item
  }

  public func configure(cell: UIView) {
    (cell as! T).configure(data: item)
  }
}

