import Resolver
import XCTest
@testable import Cryptic

class AssetServiceTests: XCTestCase {
  // MARK: - Properties
	var sut: AssetService?
	@LazyInjected var networkService: MockNetworkService


  // MARK: - Life Cycle
	override func setUp() {
		super.setUp()

		sut = AssetService()
		Resolver.registerMockServices()
	}

	override func tearDown() {
		sut = nil

		super.tearDown()
	}
}

// MARK: - Unit tests
extension AssetServiceTests {
  func testFetchAssetsSuccessfully() {
		let asset = mockAsset()
		networkService.result = .success(assetList())
		
		sut?.fetchAssets { assetList, error in
			XCTAssertEqual(assetList?.data.count, 1)
			XCTAssertEqual(assetList?.data.first, asset)
			XCTAssertNil(error)
		}
  }

  func testFetchAssetsFailure() {
		let networkError = AppError.network(description: "Something went wrong!")
		networkService.result = .failure(networkError)
		
		sut?.fetchAssets { assetList, error in
			XCTAssertEqual(networkError, error)
			XCTAssertNil(assetList)
		}
  }
}

// MARK: - Helper functions
extension AssetServiceTests {
	private func mockAsset() -> Asset {
		Asset(
			id: "bitcoin",
			name: "Bitcoin",
			symbol: "BTC",
			changePercent24Hr: "4.6112912338284003",
			marketCapUsd: "1136551580407.9842430",
			priceUsd: "60867.8140898007"
		)
	}

  private func assetList() -> Data {
    let asset = mockAsset()
    let assetListData = try? JSONEncoder().encode(AssetList(data: [asset]))
    return assetListData ?? Data()
  }
}
