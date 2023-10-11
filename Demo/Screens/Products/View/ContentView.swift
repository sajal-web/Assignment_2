//
//  ContentView.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 10/10/23.
import SwiftUI
struct ContentView: View {
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items, id: \.self) { product in // Iterate through 'items' directly
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        VStack(alignment: .leading, spacing: 8) {
                            // product name and price
                            HStack {
                                Text(product.title.prefix(20) + (product.title.count > 20 ? "..." : ""))
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("Price :$\(product.price)")
                                    .font(.subheadline)
                            }
                            // product image, category, rate, and count
                            HStack {
                                // Product image
                                ImageLoader(urlString: product.thumbnail, width: 50, height: 70)
                                    .padding(.horizontal, 30)
                                Spacer()
                                // category, Rate, and count details
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Category: \(product.category)")
                                        .font(.caption)
                                    Text("Rating: \(String(format: "%.2f", product.rating))")
                                        .font(.caption)
                                    Text("Available: \(product.stock)")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(3)
                        .onAppear{
                            // check if the current product is the laset item in the list
                            if product.id == viewModel.items.last?.id{
                                viewModel.loadMoreDataIfNeeded(currentItem: product)
                            }
                        }
                    }
                }
                .navigationTitle("Products")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
