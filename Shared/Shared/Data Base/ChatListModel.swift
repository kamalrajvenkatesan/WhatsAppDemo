//
//  ChatListModel.swift
//  Shared
//
//  Created by kamalraj venkatesan on 21/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation
import RealmSwift

public class ChatListModel: Object {
  @objc public dynamic var _id = "" // User id/Mobile Number
  @objc public dynamic var userName = ""
  @objc public dynamic var userImage = ""
  public let messages = List<MessageModel>()

  override public static func primaryKey() -> String? {
    return "_id"
  }

  public static func initilise(data: Chat) -> ChatListModel {

    let model = ChatListModel()
    model._id = data._id
    model.userName = data.name
    model.userImage = data.picture

    return model
  }

}
