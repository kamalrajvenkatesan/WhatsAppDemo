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
