
import Foundation
import Resolver

class AssetListViewModel: ObservableObject, Identifiable {
	@Published private(set) var state: AssetListViewModelState = .idle

	@Injected private var assetService: AssetService
}

extension AssetListViewModel {
	func fetchAssets() {
		state = .loading
		assetService.fetchAssets { [weak self] assetList, error in
			guard let self = self else { return }
			if let assetList = assetList {
				self.state = .loaded(assetList.data)
			} else if let error = error {
				self.state = .failed(error)
			}
		}
	}
}
