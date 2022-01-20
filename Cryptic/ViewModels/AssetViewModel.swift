struct AssetViewModel: Identifiable {
	var asset: Asset

	var id: String {
    asset.id
	}

	var name: String {
    asset.name
	}

	var symbol: String {
    asset.symbol
	}

	var price: String {
    asset.priceUsd.currencyFormattedValue()
	}

	var changePercent: String {
    asset.changePercent24Hr.percentFormattedValue()
	}

	var marketCap: String {
    asset.marketCapUsd.currencyFormattedValue()
	}

	var hasNegativeChanges: Bool {
		changePercent.hasPrefix("-")
	}
}
