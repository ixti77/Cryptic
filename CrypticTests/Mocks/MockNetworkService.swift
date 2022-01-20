import Foundation
@testable import Cryptic

class MockNetworkService: NetworkServiceProtocol {
	var result: Result<Data, AppError>?
	
	func fetch(
		with urlRequest: URLRequest,
		completion: @escaping (Result<Data, AppError>) -> Void
	) {
		guard let result = result else {
			fatalError("Result is nil")
		}

		return completion(result)
	}
}
