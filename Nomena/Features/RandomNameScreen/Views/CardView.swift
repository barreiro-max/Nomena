import SwiftUI

struct CardView: View {
    let title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                .linearGradient(
                    colors: [.bottomCard, .topCard],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .shadow(
                color: .black.opacity(0.65),
                radius: 3, x: 5, y: 5
            )
            .frame(width: 310, height: 480)
            .overlay {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 44)
            }
    }
}


#Preview {
    CardView(title: "Георгій")
}
