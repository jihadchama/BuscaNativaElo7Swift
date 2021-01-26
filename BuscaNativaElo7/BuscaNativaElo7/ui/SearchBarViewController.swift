import UIKit

class SearchBarViewController: UIViewController {
	
	let searchBar = SearchBar(frame: .zero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = searchBar
	}
}
