import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
	static let identifier = "SearchCollectionViewCell"
	
	private let productCard: ProductCard = {
		let productCard = ProductCard()
		productCard.titleLabel.text = "Título do Produto"
		productCard.installmentLabel.text = "10x R$ 66,66 sem juros"
		productCard.currentLabel.text = "R$ 666,66"
		productCard.nonPromotionalLabel.text = "R$ 777,77"
		return productCard
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(productCard)
		
		let image = [
			UIImage(named: "placeholder-1"),
			UIImage(named: "placeholder-2"),
			UIImage(named: "placeholder-3"),
			UIImage(named: "placeholder-4"),
			UIImage(named: "placeholder-5"),
			UIImage(named: "placeholder-6"),
		].compactMap({ $0 })
		
		productCard.productImage.image = image.randomElement()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		productCard.frame = contentView.bounds
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
}
