import UIKit
import Playground

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Class

        let example = Example()
        print("Field value: \(example.field)")
        /// Output: "Field value: example"


        // MARK: - Functions

        let squared = CommonKt.squared(2)
        print("Square of 2 equals \(squared)")
        /// Output: Square of 2 equals 4

        print(CommonKt.highLevelFunction())
        /// Output: I'am a high-level-function

        let array = KotlinIntArray(size: 3)
        array.set(index: 0, value: 12)
        array.set(index: 1, value: 10)
        array.set(index: 2, value: 11)
        let average = CommonKt.average(values: array)
        print("The average of 12, 10 and 11 is: \(average)")
        /// Output: "The average of 12, 10 and 11 is: 11.0

        // MARK: - Enums

        let swift = Languages.swift
        let kotlin = Languages.kotlin

        let lang = Languages.objc

        print("Swift's first appearance: \(swift.sinceYear) \nKotlin's first appearance: \(kotlin.sinceYear)")
        /// Output: Swift's first appearance: 2014
        ///         Kotlin's first appearance: 2011

        if case Languages.swift = lang {
            print("Swift")
        } else {
            print("Not Swift")
        }
        /// Output: Not Swift


        // MARK: - Generics & Sealed Classes

        func description(for node: TreeNode<NSString>) -> String {
            var description = "Node '\(node.value as! String)'"

            if node.right is TreeNone<NSString> && node.left is TreeNone<NSString> {
                description.append(" doesn't have any child")
            } else if let leftChild = node.left as? TreeNode<NSString>,
                let rightChild = node.right as? TreeNode<NSString> {

                description.append(" has children '\(leftChild.value as! String)' and '\(rightChild.value as! String)'")
            }

            return description
        }

        let leftChild = TreeNode<NSString>(value: "Left Child", left: TreeNone(), right: TreeNone())
        let rightChild = TreeNode<NSString>(value: "Right Child", left: TreeNone(), right: TreeNone())
        let parent = TreeNode<NSString>(value: "Parent", left: leftChild, right: rightChild)

        print(description(for: leftChild))
        print(description(for: parent))
        /// Output: Node 'Left Child' doesn't have any child
        ///         Node 'Parent' has children 'Left Child' and 'Right Child'


        // MARK: - Interfaces & Inheritance

        class Circle: Shape {
            func area() -> Float {
                return Float.pi * radius * radius
            }
            let radius: Float

            init(radius: Float) {
                self.radius = radius
            }
        }

        class DummyRect: Rect {
            override func area() -> Float {
                return width * height * 1.3
            }
        }

        let square = Square(side: 4)
        let rect = Rect(width: 2, height: 2)
        let dummyRect = DummyRect(width: 2, height: 2)

        let shapes: Array<Shape> = [square, rect, dummyRect]

        shapes.forEach { shape in
            print("Shape area is \(shape.area())")
            /// Outputs: Shape area is 16.0
            ///          Shape area is 4.0
            ///          Shape area is 5.2
        }

        // MARK: - Platform Specific Code

        print("platform is \(IosKt.platformName())")
        /// Outputs: platform is iOS 12.4
    }
}
