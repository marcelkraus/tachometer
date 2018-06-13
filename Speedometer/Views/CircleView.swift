import UIKit

class CircleView: UIView {
    static let startAngle = 135
    static let availableAngle = 270

    var stencilColor: CGColor = UIColor.lightGray.cgColor
    var fillColor: CGColor = UIColor.darkGray.cgColor
    var lineWeight: CGFloat = 10.0
    var fillmentLevel = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        drawCircle(with: 1.0, in: stencilColor)
        drawCircle(with: fillmentLevel, in: fillColor)
    }

    private func endAngle(fillmentLevel: Double) -> Int {
        return Int((Double(CircleView.availableAngle) * fillmentLevel) + Double(CircleView.startAngle))
    }

    private func radius(fromDegrees value: Int) -> CGFloat {
        return CGFloat(Double(value) * Double.pi / 180)
    }

    private func drawCircle(with fillmentLevel: Double, in color: CGColor) {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2),
            radius: (frame.width / 2) - lineWeight / 2,
            startAngle: radius(fromDegrees: CircleView.startAngle),
            endAngle: radius(fromDegrees: endAngle(fillmentLevel: fillmentLevel)),
            clockwise: true
        )
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color
        circleLayer.lineWidth = lineWeight
        layer.addSublayer(circleLayer)
    }
}
