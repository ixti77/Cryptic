import Foundation
import Resolver
@testable import Cryptic

extension Resolver {
	// MARK: - Mock Container

	static var mock = Resolver(parent: .main)

  // MARK: - Register Mock Services
	
	static func registerMockServices() {
		root = Resolver.mock
		defaultScope = .application
		
		Resolver.mock.register { MockNetworkService() }.implements(NetworkServiceProtocol.self)
	}
}
