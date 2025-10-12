//
//  UserInfo.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/11.
//

import Foundation

struct UserInfo: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
