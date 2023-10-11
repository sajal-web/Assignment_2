//
// ProductViewModel.swift
//Demo
//
//Created by Tapas Kumar Patra on 10/10/23.
//
import Foundation
class ProductViewModel: ObservableObject {
    @Published private(set) var items: [Product] = []
    private var skip: Int = 0
    let baseUrl = "https://dummyjson.com/products?limit=2&skip="
    var isLoading = false

    init() {
        Task.init {
            await fetchData()
        }
    }

    func loadMoreDataIfNeeded(currentItem item: Product) {
        guard !isLoading, items.isLastItem(item) else { return }
        Task.init {
            isLoading = true
            skip += 2 // increase skip value to load the next set of items
            await fetchData()
            isLoading = false
        }
    }

    func fetchData() async {
        do {
            print(baseUrl + "\(skip)")
            guard let url = URL(string: baseUrl + "\(skip)")
            
            else {
                fatalError("Missing URL")
            }
            

            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error while fetching data")
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Item.self, from: data)

            DispatchQueue.main.async {
                self.items.append(contentsOf: decodedData.products)
            }

        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

extension Array where Element: Identifiable {
    func isLastItem(_ item: Element) -> Bool {
        guard let lastItem = self.last else { return false }
        return item.id == lastItem.id
    }
}
