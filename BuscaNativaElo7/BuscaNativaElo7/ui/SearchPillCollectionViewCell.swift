import UIKit

class SearchPillCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "SearchPillViewCell"
	
	private let searchPill: SearchPill = {
		let searchPill = SearchPill()
		return searchPill
	}()
	
	func render(pill: PillModel) {
		searchPill.pillLabel.text = pill.title
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(searchPill)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		searchPill.frame = contentView.bounds
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
}
