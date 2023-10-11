//
//  ProductDetailsView.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 11/10/23.
//

import SwiftUI

struct ProductDetailsView: View {
    var product : Product
    var body: some View {
        NavigationView{
            VStack{
                ImageLoader(urlString: product.thumbnail,width: 150,height: 150)
                    .padding(20)

                HStack(alignment: .center){
                    VStack(alignment: .leading){
                        Text("Category").font(.headline)
                        Text(product.category).font(.subheadline).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        Text("Price : $\(String(product.price))")
                            .font(.headline)
                    }
                    Spacer()
                    VStack(alignment: .leading){

                        HStack{
                            Image(systemName: "star.fill")
                                .font(Font.system(size: 20))
                                .foregroundColor(.yellow)
                            Text(String(product.rating))
                                .font(.headline)
                        }
                        Text("Available : \(product.stock)")
                            .font(.headline)
                    }

                }
                Text(product.description)
                    .font(.headline)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(
            product: Product(id : 1,
                             title: "sajal",
                             description: "Sample Desc.",
                             price: 99,
                             discountPercentage: 45,
                             rating: 4.5,
                             stock: 50,
                             brand: "Something",
                             category: "groceries",
                             thumbnail:"https://i.dummyjson.com/data/products/21/thumbnail.png",
                             images: []
                            )
        )
    }
}

