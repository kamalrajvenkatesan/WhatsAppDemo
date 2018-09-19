//
//  Helper.swift
//  Shared
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import Foundation

/** load json from json file */
public func loadJson<T: Decodable>(type: T.Type, fileName: String) -> T? {

  guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {

    return nil
  }
  do {
    let data = try Data.init(contentsOf: url)
    let decoder = JSONDecoder()
    let jsonData = try decoder.decode(T.self, from: data)

    return jsonData
  } catch let error {
    print(error)
    return nil
  }

}


