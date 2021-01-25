import Alamofire

class SearchClient {
	
	func getProducts(url: String) {
		let request = AF.request(url)
		request.responseDecodable(of: [ProductCardModel].self) { response in
			guard let products = response.value else { return }
			print(products[0].title)
		}
	}
}
