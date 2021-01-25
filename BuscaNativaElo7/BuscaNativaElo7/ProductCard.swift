import UIKit
import SnapKit

class ProductCard: UIView {

	lazy var productImage: UIImageView = {
		let imageView = UIImageView()
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 12)
		label.textColor = .darkGray
		return label
	}()
	
	lazy var nonPromotionalLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 10)
		label.textColor = .darkGray
		return label
	}()
	
	lazy var currentLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16)
		label.textColor = .darkGray
		return label
	}()
	
	lazy var installmentLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 10)
		label.textColor = .darkGray
		return label
	}()
	
	fileprivate func constraints() {
		productImage.snp.makeConstraints { make in
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.top.equalToSuperview()
			make.height.equalTo(140)
		}
		
		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(productImage.snp_bottom).offset(4)
			make.right.equalTo(productImage).offset(4)
			make.left.equalTo(productImage).offset(4)
		}
		
		nonPromotionalLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp_bottom).offset(8)
			make.right.equalTo(titleLabel)
			make.left.equalTo(titleLabel)
		}
		
		currentLabel.snp.makeConstraints { make in
			make.top.equalTo(nonPromotionalLabel.snp_bottom).offset(2)
			make.right.equalTo(nonPromotionalLabel)
			make.left.equalTo(nonPromotionalLabel)
		}
		
		installmentLabel.snp.makeConstraints { make in
			make.top.equalTo(currentLabel.snp_bottom).offset(2)
			make.right.equalTo(currentLabel)
			make.left.equalTo(currentLabel)
		}
	}
	
	fileprivate func addSubviews() {
		addSubview(productImage)
		addSubview(titleLabel)
		addSubview(nonPromotionalLabel)
		addSubview(currentLabel)
		addSubview(installmentLabel)
	}
	
	override init(frame: CGRect) {
		super.init(frame: CGRect(x: 0, y: 0, width: 140, height: 236))
		self.backgroundColor = .white
		addSubviews()
		constraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
