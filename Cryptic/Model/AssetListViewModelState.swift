enum AssetListViewModelState: Equatable {
	case idle
	case loading
	case failed(AppError)
	case loaded([Asset])
}
