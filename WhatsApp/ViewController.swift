//
//  ViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared
import Chat
import RealmSwift
import Contacts

class ViewController: BaseTableViewController<ChatListTableViewCell, ChatListModel> {


  override func viewDidLoad() {
    super.viewDidLoad()

    // Search bar
    let searchBar = UISearchController(searchResultsController: nil)
    self.navigationItem.searchController = searchBar

    // Remove back button title.
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    // Bar button
    let newChatBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "New Chat"), style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = newChatBarButton

    let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
    self.navigationItem.leftBarButtonItem = editBarButton


    if !UserDefaults.standard.bool(forKey: "isExistingLogin") {
      UserDefaults.standard.set(true, forKey: "isExistingLogin")
      saveJsonIntoDataBase()
    }


    items = Array(try! Realm().objects(ChatListModel.self).sorted(byKeyPath: "recentInterationTime", ascending: true))

    self.getContactsFromAddressBook()

    }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.navigationController?.navigationBar.prefersLargeTitles = true
  }

  private func getContactsFromAddressBook() {
    let status = CNContactStore.authorizationStatus(for: .contacts)
    if status == .denied || status == .restricted {
      presentSettingsActionSheet()
      return
    }

    // open it

    let store = CNContactStore()
    store.requestAccess(for: .contacts) { granted, error in
      guard granted else {
        DispatchQueue.main.async {
          self.presentSettingsActionSheet()
        }
        return
      }

      // get the contacts

      var contacts = [CNContact]()
      let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey as NSString, CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey as CNKeyDescriptor])
      do {
        try store.enumerateContacts(with: request) { contact, stop in
          contacts.append(contact)
        }
      } catch {
        print(error)
      }


      for contact in contacts {
        print(contact)
      }
    }
  }

  private func presentSettingsActionSheet() {
    let alert = UIAlertController(title: "Permission to Contacts", message: "This app needs access to contacts in order to access contacts", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Go to Settings", style: .default) { _ in
      let url = URL(string: UIApplicationOpenSettingsURLString)!
      UIApplication.shared.open(url)
    })
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(alert, animated: true)
  }


  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = ChatViewController()
    vc.chatId = items[indexPath.row]._id
    self.navigationController?.pushViewController(vc, animated: true)
    
  }

}
