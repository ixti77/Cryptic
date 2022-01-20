struct Asset: Codable, Identifiable, Equatable {
	var id: String
	var name: String
	var symbol: String
	var changePercent24Hr: String
	var marketCapUsd: String
	var priceUsd: String
}
