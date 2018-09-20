//
//  CellConfigurator.swift
//  Shared
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
  associatedtype U // Data type
  func configure(data: U)
}
