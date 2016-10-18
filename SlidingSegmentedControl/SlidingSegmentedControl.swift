import UIKit

public class SlidingSegmentedControl: UIControl {

    // MARK: Initialization

    public init(numberOfItems: Int) {
        super.init(frame: .zero)
        initButtons(number: numberOfItems)
        initStackView()
    }

    required public init?(coder aDecoder: NSCoder) {
        return nil
    }

    var selectedSegment = 0

    let stackView = UIStackView()

    private func initStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buttons.forEach { (button) in
            stackView.addArrangedSubview(button)
        }
        NSLayoutConstraint.activate(stackViewConstraints)
    }

    private var stackViewConstraints: [NSLayoutConstraint] {
        return [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)]
    }

    var buttons: [UIButton] = []

    private func initButtons(number: Int) {
        for _ in 0..<number {
            buttons += [UIButton()]
        }
    }
}
