struct PriceModel: Codable {
	var current: String
	var installment: String
	
	enum CodingKeys: String, CodingKey {
		case current
		case installment
	}
}
