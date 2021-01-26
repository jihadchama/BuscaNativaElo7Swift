import UIKit
import SnapKit

class SearchBar: UIView {

	lazy var containerView: UIView = {
		let containerView = UIView()
		containerView.backgroundColor = UIColor(red: 253/255, green: 185/255, blue: 51/255, alpha: 1)
		return containerView
	}()
	
	lazy var searchTextField: UITextField = {
		let searchTextField = UITextField()
		searchTextField.backgroundColor = .white
		searchTextField.layer.cornerRadius = 4.0
		searchTextField.placeholder = "Buscar"
		
		paddingTextField(searchTextField)
		addSearchButtonToTextField(searchTextField)
		
		return searchTextField
	}()
	
	lazy var backButton: UIButton = {
		let backButton = UIButton(type: .custom)
		backButton.backgroundColor = UIColor(white: 1, alpha: 0)
		backButton.setImage(UIImage(named: "back-button"), for: .normal)
		backButton.imageEdgeInsets = UIEdgeInsets(top: 12.5, left: 3.5, bottom: 12.5, right: 3.5)
		backButton.contentHorizontalAlignment = .fill
		backButton.contentVerticalAlignment = .fill
		return backButton
	}()

	fileprivate func makeConstraints() {
		containerView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.right.equalToSuperview()
			make.left.equalToSuperview()
			make.height.equalTo(100)
		}
		
		searchTextField.snp.makeConstraints { make in
			make.top.equalTo(containerView.snp_top).offset(50)
			make.right.equalTo(containerView.snp_right).offset(-15)
			make.height.equalTo(40)
		}
		
		backButton.snp.makeConstraints { make in
			make.top.equalTo(containerView.snp_top).offset(50)
			make.right.equalTo(searchTextField.snp_left).offset(-10)
			make.left.equalTo(containerView.snp_left).offset(10)
			make.height.equalTo(searchTextField.snp_height)
			make.width.equalTo(20)
		}
	}
		
	fileprivate func addSubviews() {
		addSubview(containerView)
		addSubview(searchTextField)
		addSubview(backButton)
	}
	
	fileprivate func paddingTextField(_ searchTextField: UITextField) {
		searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: searchTextField.frame.height))
		searchTextField.leftViewMode = .always
	}
		
	fileprivate func addSearchButtonToTextField(_ searchTextField: UITextField) {
		let searchButton = UIButton(frame: CGRect(x: searchTextField.frame.size.width,
												  y: 0,
												  width: 100,
												  height: searchTextField.frame.height))
		
		searchButton.backgroundColor = UIColor(white: 1, alpha: 0)
		
		searchButton.setImage(UIImage(named: "search-button"), for: .normal)
		
		searchButton.imageEdgeInsets = UIEdgeInsets(top: 0,
													left: -16,
													bottom: 0,
													right: 0)
		
		searchTextField.rightView = searchButton
		searchTextField.rightViewMode = .always
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubviews()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
