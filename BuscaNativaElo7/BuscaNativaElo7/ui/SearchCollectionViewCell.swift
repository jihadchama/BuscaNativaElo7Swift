import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
	static let identifier = "SearchCollectionViewCell"
	
	private let productCard: ProductCard = {
		let productCard = ProductCard()
		return productCard
	}()
	
	func render(productCardModel: ProductCardModel) {
		productCard.titleLabel.text = productCardModel.title
		productCard.currentLabel.text = productCardModel.price.current
		productCard.productImage.load(url: productCardModel.picture)
		if let installment = productCardModel.price.installment {
			productCard.installmentLabel.text = installment
		}
		
		if let nonPromotional =  productCardModel.price.nonPromotional {
			productCard.nonPromotionalLabel.attributedText = NSAttributedString(string: nonPromotional, attributes: [NSAttributedString.Key.strikethroughStyle: 1])
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(productCard)
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
