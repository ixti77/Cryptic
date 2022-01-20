import SwiftUI

struct ErrorView: View {
	var errorMessage: String

	var body: some View {
		Text(errorMessage)
			.multilineTextAlignment(.center)
			.padding()
	}
}

struct ErrorView_Previews: PreviewProvider {
	static var previews: some View {
		ErrorView(errorMessage: "Error")
	}
}
