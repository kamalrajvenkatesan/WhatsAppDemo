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
  @objc public dynamic var _id = ""
  @objc public dynamic var chatId = ""
  @objc public dynamic var message = ""
  @objc public dynamic var date = ""
  @objc public dynamic var time = ""
  @objc public dynamic var createdTs = Date()
  @objc public dynamic var isSent = true

  override public static func primaryKey() -> String? {
    return "_id"
  }

  public static func initilise(data: Message) -> MessageModel {

    let currentDate = Date()

    let model = MessageModel()
    model._id = data._id
    model.chatId = data._id
    model.message = data.message
    model.date = currentDate.getDate()
    model.time = currentDate.getTime()
    model.isSent = (data.status == "sent")

    return model
  }

  public static func encode(model: MessageModel) -> Message {

    return Message(_id: model._id, time: model.time, message: model.message, status: (model.isSent) ? "sent" : "received")
  }
}
