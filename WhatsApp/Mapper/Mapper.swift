//
//  Mapper.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

struct ChatResponse: Decodable {
  var chat: [Chat]
}

struct Chat: Decodable {
  var _id: String
  var index: String
  var picture: String
  var name: String
  var time: Date
  var message: String
}
