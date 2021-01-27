import Alamofire
import UIKit
import SafariServices

class SearchViewController: UIViewController {
	
	private let kProductsURL = "https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products"
	
	private var searchResultDataSource: [ProductCardModel] = []
	
	private var searchPillsDataSource: [PillModel] = []
	
	private let searchBar =	SearchBar()
	
	private let searchResultsCollectionView = UICollectionView(frame: .zero,
															   collectionViewLayout: UICollectionViewFlowLayout())
	
	private var searchPillsCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let pillLayout = UICollectionViewFlowLayout()
		pillLayout.scrollDirection = .horizontal
		
		self.searchPillsCollectionView = UICollectionView(frame: .zero,
														  collectionViewLayout: pillLayout)
			
		let searchView = SearchStackView(arrangedSubviews: [searchBar, searchPillsCollectionView, searchResultsCollectionView])
		setupStackView(stackView: searchView)
		setupCollectionViews()
		
		view.addSubview(searchView)
		
		self.getPills()
		self.getProducts(url: kProductsURL)
	}
}

//MARK: - SearchViewController Layout
extension SearchViewController {
	
	fileprivate func setupCollectionViewsLayouts() {
		searchResultsCollectionView.backgroundColor = UIColor(red: 244/255,
												 green: 245/255,
												 blue: 247/255,
												 alpha: 1)
		searchResultsCollectionView.showsVerticalScrollIndicator = false
		
		searchPillsCollectionView.backgroundColor = .white
		searchPillsCollectionView.showsHorizontalScrollIndicator = false
		
		searchPillsCollectionView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(100)
			make.right.left.equalToSuperview()
			make.height.equalTo(46)
		}
		
		searchResultsCollectionView.snp.makeConstraints { make in
			make.top.equalTo(searchPillsCollectionView.snp_bottom)
			make.left.right.bottom.equalToSuperview()
		}
	}
		
	fileprivate func setupStackView(stackView: UIStackView) {
		stackView.frame = self.view.bounds
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.spacing = 20
	}
}

//MARK: - SearchViewController CollectionView methods

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
	
	fileprivate func setupCollectionViews() {
		searchPillCollectionViewSetup()
		searchResultsCollectionViewSetup()
		
		setupCollectionViewsLayouts()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == searchPillsCollectionView {
			return searchPillsDataSource.count
		}
		return searchResultDataSource.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if collectionView == searchPillsCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchPillCollectionViewCell.identifier, for: indexPath) as! SearchPillCollectionViewCell
			
			cell.render(pill: searchPillsDataSource[indexPath.item])
			
			return cell
		}
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
		
		cell.render(productCardModel: searchResultDataSource[indexPath.item] )
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if collectionView == searchPillsCollectionView {
			let width = searchPillsDataSource[indexPath.item].title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]).width
			
			return CGSize(width: width, height: 30)
		}
		return CGSize(width: 185, height: 286)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		if collectionView == searchPillsCollectionView {
			return 40
		}
		
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if collectionView == searchPillsCollectionView {
			return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		}
		
		return UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if collectionView == searchPillsCollectionView {
			return
		}
		
		collectionView.deselectItem(at: indexPath, animated: true)
		let productURL = (searchResultDataSource[indexPath.item]).link
		let webView = SFSafariViewController.init(url: URL(string: productURL)!)
		self.present(webView, animated: true)
	}
	
	fileprivate func searchPillCollectionViewSetup() {
		searchPillsCollectionView.register(SearchPillCollectionViewCell.self,
										   forCellWithReuseIdentifier: SearchPillCollectionViewCell.identifier)
		
		searchPillsCollectionView.delegate = self
		searchPillsCollectionView.dataSource = self
	}
	
	fileprivate func searchResultsCollectionViewSetup() {
		searchResultsCollectionView.register(SearchCollectionViewCell.self,
											 forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
		
		searchResultsCollectionView.delegate = self
		searchResultsCollectionView.dataSource = self
	}
}

//MARK: - SearchViewController DataProcess

extension SearchViewController {
	
	func getProducts(url: String) {
		AF.request(url)
			.validate()
			.responseDecodable(of: [ProductCardModel].self) { [self] response in
				guard let products = response.value else { return }
				self.searchResultDataSource = products
				self.searchResultsCollectionView.reloadData()
		}
	}
	
	func getPills() {
		if let pillsPath = Bundle.main.path(forResource: "pills", ofType: "json") {
			
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: pillsPath), options: .mappedIfSafe)
				let pills = try JSONDecoder().decode([PillModel].self, from: data)
				self.searchPillsDataSource = pills
				self.searchPillsCollectionView.reloadData()
			} catch {
				print(error)
			}
		}
	}
}
