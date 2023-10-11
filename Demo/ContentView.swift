//
//  ContentView.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductViewModel()
     
     var body: some View {
         NavigationView{
             if let items = viewModel.item{
                 List{
                     ForEach(items.products, id: \.self) {product in
//                         NavigationLink(destination : ProductDetailView(product:product)
//                         ){
                             VStack(alignment : .leading, spacing: 8){
                                 // product name and price
                                 HStack{
                                     Text(product.title.prefix(20) + (product.title.count>20 ? "..." : ""))
                                         .font(.headline)
                                         .foregroundColor(.blue)
                                     Spacer()
                                     Text("$ \(String(format : "%.2f",product.price))")
                                         .font(.subheadline)
                                 }
                                 // product image, category, rate, and count
                                 HStack(spacing : 8){
                                     // Product image
//                                     ImageLoader(urlString: product.thumbnail,width:50,height:70)
//                                         .padding(10)
                                     Spacer()
                                     // category, Rate, and count details
                                     VStack(alignment : .leading, spacing: 4){
                                         Text("Category : \(product.category)")
                                             .font(.caption)
                                         Text("Rating : \(String(format : "%.2f",product.rating))")
                                             .font(.caption)
                                         Text("Available : \(product.stock)")
                                             .font(.caption)

                                     }
                                 }
                             }
                             .padding(3)
//                             .onTapGesture {
//                                 selectedProduct = product
//                             }
//                         }

                     }
                 }
                     }

                 }
         .navigationTitle("Products")
//                 .task {
//                     await viewModel.fetchData()
//                 }
//         VStack(spacing: 20) {
//             if let product = viewModel.vehicle  {
//                 List{
//                     ForEach(product.products) { item in
//                         Text(item.title)
//                     }
//                 }
//             }
//         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
