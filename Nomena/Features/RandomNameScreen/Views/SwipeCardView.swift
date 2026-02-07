import SwiftUI

struct SwipeCardView: View {
    @State var offset: CGSize = .zero
    @State var color: Color = .clear
    
    var title: String
    var body: some View {
        CardView(title: title)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(color.opacity(0.55))
            }
            .offset(x: offset.width, y: offset.height * 0.4)
            .rotationEffect(
                .degrees(Double(offset.width / 30))
            )
            .gesture(swipeCardGesture)
            .animation(.default, value: offset)
            .animation(.default, value: color)
    }
    
    private var swipeCardGesture: some Gesture {
        DragGesture()
            .onChanged{ gesture in
                offset = gesture.translation
                changeColor(width: offset.width)
            }
            .onEnded{ _ in
                swipeCard(width: offset.width)
                changeColor(width: offset.width)
            }
    }
    
    // MARK: - Swipe functions
    private func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-120):
            offset = CGSize(width: -500, height: 0)
        case 120...500:
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    private func changeColor(width: CGFloat) {
        switch width {
        case -500...(-120):
            color = .red
        case 120...500:
            color = .green
        default:
            color = .clear
        }
    }
}

#Preview {
    SwipeCardView(title: "Тестове Імʼя")
}
