//
//  Mapper.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

public struct Chat: Decodable {
  public var _id: String
  public var index: Int
  public var picture: String
  public var name: String
  public var time: String
  public var message: String
}
