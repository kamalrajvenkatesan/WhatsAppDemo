//
//  ContactsViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 21/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared
import RealmSwift

class ContactsViewController: BaseTableViewController<ContactCell, ContactModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      items = Array(try! Realm().objects(ContactModel.self).sorted(byKeyPath: "name", ascending: true))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
