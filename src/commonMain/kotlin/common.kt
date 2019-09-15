package playground

import kotlin.math.pow

class Example {
    val field = "example"
}

// Functions: High-level, extensions, variadic

fun Int.squared(): Int {
    return this * 2
}

fun highLevelFunction(): String {
    return "I'am a high-level-function"
}

fun average(vararg values: Int): Double {
    return values.average()
}

// Enumerations

enum class Languages(val sinceYear: String) {
    OBJC("1984"),
    SWIFT("2014"),
    KOTLIN("2011")
}

// Sealed class & generic
sealed class Tree<T> {
    data class Node<T>(var value: T,
                       var left: Tree<T> = None(),
                       var right: Tree<T> = None()): Tree<T>()
    class None<T>: Tree<T>()
}

// Interfaces / Inheritance

interface Shape {
    fun area(): Float
}

class Square(val side: Float) : Shape {
    override fun area() = side.pow(2)
}

open class Rect(val width: Float, val height: Float) : Shape {
    override fun area() = width * height
}

// Expect
expect fun platformName(): String
