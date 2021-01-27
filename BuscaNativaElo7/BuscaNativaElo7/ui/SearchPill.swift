import UIKit
import SnapKit

class SearchPill: UIView {
	
	lazy var searchPill: UIView = {
		let searchPill = UIView()
		searchPill.backgroundColor = UIColor(red: 254/255,
											 green: 227/255,
											 blue: 173/255,
											 alpha: 1)
		searchPill.layer.cornerRadius = 15.0
		return searchPill
	}()
	
	lazy var pillLabel: UILabel = {
		let pillLabel = UILabel()
		pillLabel.font = .systemFont(ofSize: 12)
		return pillLabel
	}()
	
	func makeConstraints() {
		searchPill.snp.makeConstraints { make in
			make.width.equalTo(pillLabel.snp_width).offset(30)
			make.height.equalTo(30)
		}
		
		pillLabel.snp.makeConstraints { make in
			make.center.equalTo(searchPill)
			make.width.lessThanOrEqualToSuperview()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(searchPill)
		searchPill.addSubview(pillLabel)
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
