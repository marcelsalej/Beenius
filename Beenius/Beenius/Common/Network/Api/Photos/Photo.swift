//
//  Photo.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

struct Photo: Codable {
  let id: Int
  let albumId: Int
  let title: String
  let url: String
  let thumbnailUrl: String
}
