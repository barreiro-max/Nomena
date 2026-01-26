import SwiftUI

struct LikeButton: View {
    var onLike: () -> Void
    var body: some View {
        Button(action: onLike) {
            Image(systemName: "hand.thumbsup.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 100)
        .background(.likeButton)
        .clipShape(.circle)
    }
}

#Preview {
    LikeButton { print("Імʼя уподобано") }
}


