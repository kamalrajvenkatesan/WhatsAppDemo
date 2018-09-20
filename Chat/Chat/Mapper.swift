//
//  Mapper.swift
//  Chat
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

public struct Message: Decodable {
  var _id: String
  var time: String
  var message: String
  var status: String
}

public struct Chat: Decodable {
  public var _id: String
  public var index: Int
  public var picture: String
  public var name: String
  public var time: String
  public var message: String
}
