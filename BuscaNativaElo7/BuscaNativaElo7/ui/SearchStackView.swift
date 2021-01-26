import UIKit
import SnapKit

class SearchStackView: UIStackView {

	lazy var stackView: UIStackView  = {
		let stackView = UIStackView()
		return stackView
	}()
	
	func makeConstraints() {
		stackView.snp.makeConstraints { make in
			make.top.left.bottom.right.equalToSuperview()
		}
	}
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(stackView)
		makeConstraints()
	}
	
	required init(coder: NSCoder) {
		fatalError()
	}
}
