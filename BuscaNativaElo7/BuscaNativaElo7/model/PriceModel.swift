struct PriceModel: Codable {
	var current: String
	var installment: String?
	var nonPromotional: String?
	
	enum CodingKeys: String, CodingKey {
		case current
		case installment
		case nonPromotional
	}
}
