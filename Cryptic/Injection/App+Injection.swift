import Foundation
import Resolver

extension Resolver: ResolverRegistering {
	public static func registerAllServices() {
		defaultScope = .graph
		
		register { URLSession(configuration: .default) }
		register { NetworkService() }.implements(NetworkServiceProtocol.self)
		register { URLComponentsService() }
		register { AssetService() }
		
		register { _, args in
			AssetViewModel(asset: args())
		}
		
		register { AssetListViewModel() }
	}
}
