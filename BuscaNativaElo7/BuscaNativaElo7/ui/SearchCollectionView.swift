import UIKit

class SearchCollectionView: UICollectionView {
	
	let layout = UICollectionViewFlowLayout()
	
	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: .zero, collectionViewLayout: self.layout)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
