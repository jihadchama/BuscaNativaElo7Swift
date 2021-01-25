import UIKit

class ViewController: UIViewController {
	
	let client = SearchClient()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		client.getProducts(url: "https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products")
	}
}

