//
//  MessageModel.swift
//  Shared
//
//  Created by kamalraj venkatesan on 20/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation
import RealmSwift

public class MessageModel: Object {
  @objc dynamic var _id = ""
  @objc dynamic var chatId = ""
  @objc dynamic var message = ""
  @objc dynamic var date = ""
  @objc dynamic var time = ""
  @objc dynamic var isSent = true

  public static func initilise(data: Message) -> MessageModel {

    let model = MessageModel()
    model._id = data._id
    model.chatId = data._id
    model.message = data.message
    model.date = "Today"
    model.time = data.time
    model.isSent = (data.status == "sent")

    return model
  }

  public static func encode(model: MessageModel) -> Message {

    return Message(_id: model._id, time: model.time, message: model.message, status: (model.isSent) ? "sent" : "received")
  }
}
