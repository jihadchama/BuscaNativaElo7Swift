import Alamofire
import UIKit
import SafariServices

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	private var dataSource: [ProductCardModel] = []
	
	private let collectionView = UICollectionView(
		frame: .zero,
		collectionViewLayout: UICollectionViewFlowLayout()
	)

	override func viewDidLoad() {
		super.viewDidLoad()

		self.getProducts(url: "https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products")

		collectionView.register(SearchCollectionViewCell.self,
								forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		collectionView.frame = view.bounds
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
		cell.render(productCardModel: dataSource[indexPath.item])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (view.frame.size.width/2)-2,
					  height: 236)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		let productURL = dataSource[indexPath.item].link
		let webView = SFSafariViewController.init(url: URL(string: productURL)!)
		self.present(webView, animated: true)
	}
}

extension ViewController {
	
	func getProducts(url: String) {
		AF.request(url)
			.validate()
			.responseDecodable(of: [ProductCardModel].self) { response in
				guard let products = response.value else { return }
				self.dataSource = products
				self.collectionView.reloadData()
		}
	}
}
