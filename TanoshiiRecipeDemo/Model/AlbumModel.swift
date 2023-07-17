//
//  AlbumModel.swift
//  TanoshiiRecipeDemo
//
//  Created by 張俊傑 on 2023/07/17.
//

import Foundation

struct AlbumModel: Codable{
    var pagination: PaginationModel
    var cooking_records: [CookingRecordsModel]
}

struct PaginationModel: Codable{
    var total: Int
    var offset: Int
    var limit: Int
}

struct CookingRecordsModel: Codable, Equatable{
    var image_url: String
    var comment: String
    var recipe_type: String
    var recorded_at: String
}
