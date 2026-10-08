import SwiftUI

/// Places views from left to right, starting a new row when necessary.
struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        arrangement(for: subviews, availableWidth: proposal.width).size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let arrangement = arrangement(for: subviews, availableWidth: bounds.width)

        for (index, subview) in subviews.enumerated() {
            let position = arrangement.positions[index]
            subview.place(
                at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y),
                anchor: .topLeading,
                proposal: .unspecified
            )
        }
    }

    // Measurement and placement use the same row calculation.
    private func arrangement(for subviews: Subviews, availableWidth: CGFloat?) -> (size: CGSize, positions: [CGPoint]) {
        let width = max(0, availableWidth ?? .infinity)
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var contentWidth: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            // Keep an oversized individual tag intact rather than splitting its text.
            if x > 0 && x + size.width > width {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }

            positions.append(CGPoint(x: x, y: y))
            contentWidth = max(contentWidth, x + size.width)
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }

        return (
            CGSize(width: contentWidth, height: subviews.isEmpty ? 0 : y + rowHeight),
            positions
        )
    }
}
