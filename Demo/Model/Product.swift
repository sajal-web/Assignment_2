//
//  Product.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 10/10/23.
//

import Foundation

struct Product : Decodable, Identifiable, Hashable {
    var id: Int
    var title : String
    var description : String
    var price : Int
    var discountPercentage : Double
    var rating : Double
    var stock : Int
    var brand : String
    var category : String
    var thumbnail : String
    var images : [String]
}
