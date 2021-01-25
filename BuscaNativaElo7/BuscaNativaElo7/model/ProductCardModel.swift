struct ProductCardModel: Codable {
	var title: String
	var price: PriceModel
	var id: Int
	var link: String
	var picture: String
	
	enum CodingKeys: String, CodingKey {
		case title
		case price
		case id
		case link = "_link"
		case picture
	}
}
