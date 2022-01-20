
import Foundation
import Resolver

// MARK: - AssetServiceProtocol

	
// MARK: - AssetService
class AssetService {
	@Injected private var networkService: NetworkServiceProtocol
	@Injected private var urlComponentsService: URLComponentsService
}

extension AssetService {
	func fetchAssets(completion: @escaping (AssetList?, AppError?) -> Void) {
		guard let url = urlComponentsService.makeCryptoCurrencyComponents().url else {
			return completion(nil, AppError.badURL(description: "The URL is not valid. Please try again later."))
		}

		networkService.fetch(with: URLRequest(url: url)) { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let data):
					guard let assets = try? data.decoded() as AssetList else {
						completion(nil, AppError.parsing(description: "Parsing data failed, please try again later."))
						return
					}
					return completion(assets, nil)
				case .failure(let error):
					return completion(nil, error)
				}
			}
		}
	}
}
