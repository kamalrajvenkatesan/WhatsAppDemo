//
//  ContactModel.swift
//  Shared
//
//  Created by kamalraj venkatesan on 21/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation
import RealmSwift

public class ContactModel: Object {
  @objc public dynamic var phoneNumber = ""
  @objc public dynamic var name = ""

  override public static func primaryKey() -> String? {
    return "phoneNumber"
  }

}
