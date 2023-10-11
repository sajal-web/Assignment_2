//
//  ProductViewModel.swift
//  Demo
//
//  Created by Tapas Kumar Patra on 10/10/23.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published private(set) var item: Item?
    
    init() {
        Task.init {
            await fetchData()
        }
    }
    
    func fetchData() async {
        do {
            guard let url = URL(string: "https://dummyjson.com/products") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Item.self, from: data)
            
            DispatchQueue.main.async {
                self.item = decodedData
            }
            
            
        } catch {
            print("Error fetching data from Pexels: \(error)")
        }
    }
}
