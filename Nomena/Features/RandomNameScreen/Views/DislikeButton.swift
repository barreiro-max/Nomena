import SwiftUI

struct DislikeButton: View {
    var ondislike: () -> Void
    var body: some View {
        Button(action: ondislike) {
            Image(systemName: "hand.thumbsdown.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 100)
        .background(.dislikeButton)
        .clipShape(.circle)
    }
}

#Preview {
    DislikeButton { print("Імʼя неуподобано") }
}



