import SwiftUI
import Resolver

struct AssetListView: View {
	@ObservedObject var assetListViewModel: AssetListViewModel = Resolver.resolve()

	var body: some View {
		switch assetListViewModel.state {
		case .idle:
			Color.appBackground.onAppear {
				assetListViewModel.fetchAssets()
			}
		case .loading:
			ProgressView("Loading Assets...")
		case .failed(let error):
			ErrorView(errorMessage: error.description)
		case .loaded(let assets):
			NavigationView {
				ScrollView {
					ForEach(assets) {	asset in
						AssetView(assetViewModel: Resolver.resolve(args: asset))
					}
					.padding(EdgeInsets(top: 16, leading: 12, bottom: 16, trailing: 12))
				}
				.background(Color.appBackground)
				.navigationTitle("Cryptic")
			}
			.navigationViewStyle(StackNavigationViewStyle())
		}
	}
}
