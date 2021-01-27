struct PillModel: Codable {
	var title: String
	
	enum CodingKeys: String, CodingKey {
		case title
	}
}
