# Plato

![PlatoLogo](/Resources/PlatoLogoWide.png)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpedroesli%2FPlato%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/pedroesli/Plato)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpedroesli%2FPlato%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/pedroesli/Plato)

Plato is an interpreter written in Swift and inspired by R. It is a high-level, [imperative](https://en.wikipedia.org/wiki/Imperative_programming), [structured programming](https://en.wikipedia.org/wiki/Structured_programming) and [gradually typed](https://en.wikipedia.org/wiki/Gradual_typing) language. Its goal is to make mathematical operations easier and to be able to develop iOS apps that can integrate a programming language without the need to compile it.

# How to use

```swift
let code = """
a = 25 + (2 ** 3)
b = a - 5
b
"""
let plato = Plato()
try await plato.run(code)
```

You can also configure Plato

```swift
// Limit the run loop until the specified value (inclusive).
plato.config.loop = .max(100)
```

Or use print handlers for custom printing

```swift
let results: [String] = []

plato.config.setPrintHandler { printValue in
    results.append(printValue.formattedValue)
}
```

Or for reading user input when the readLine() function is used

```swift
let code = """
a = readLine()
a // Prints "Plato is awesome!"
"""
let plato = Plato()
plato.config.readLine = .continuation
try await plato.run(code)

plato.readLineContinuation.resume(returning: Value(string: "Plato is awesome!"))
```

# Basics

To do simple calculations, just add the equations together and it will print the result without the need of using the `print` function.

```r
1 + 3 * 2        # prints 7

"Hello, World!"  # prints Hello, World!
```

Or you may just use the traditional `print` function.

```r
print(10 % 2)
x = 10
y = 1
print("x = ", x, " y = ", y)
```

The `print` function can also be used with the separator and terminator parameters to give a more custom representation.

```r
print(1, 2, 3, 4, separator: " ... ", terminator: "\n\n")
# prints 1 ... 2 ... 3 ... 4

print("Hello, ", terminator: "")
print("World")
#prints Hello, World

print(10, 15, 20, 25, separator: ", ")
#prints 10, 15, 20, 25
```

You can write multiples expressions by adding a new line or by separating them using `**;**` . 

```r
1 + 40.5
-23 / 3
print(20.02); 60 == 2
```

# Comments

A single line comment in Plato starts with `#`, or you can also write multiple lines of comments by wrapping it around `##`

```r
# This is a comment
60.2 + 10
70 * 2 # This is also a comment

## This is
	A multiline
	comment
##
print(61 < 3)
```

# Data Types

- boolean
- int
- float
- double
- string

```r
# boolean
true
false

# int
42
1_000_00 # is equivalent to 10000

# float
15.123456 
1_00.00_2 # is equivalent to 100.002

# double
0.236819230486571

# string
"Hello, World!"
"Plato" + " is" + " awesome!"
```

# Collection Types

- Array

```r
# Array
x = [1, 2, 3, 4]
x[0] = 5

# Append another array
x = x + [5, 6] 

# Arrays can hold any type
y = [1, 1.5, true, "hello"]
```

# Variables

Variables can be declared by using the `=` sign and are implicit of `any` type

```r
a = 20
b = 25.5
c = a + b
```

Variables can be assigned a specific type. Once assigned, the variable must always hold that type, and assigning an incompatible value will cause an error.

Types are specified using the `:` symbol.

```r
a: any = 25
b: bool = true
c: int = 1
d: float = 1.5
e: double = 1.1235632
f: number = 25 # accepts float, int and bool
g: string = "This is a string"
h: array = [1, 2, 3]
```

# Operators

## **Arithmetic Operators**

| Operator | Name |
| --- | --- |
| + | Addition |
| - | Subtraction |
| * | Multiplication |
| / | Division |
| ** | Exponent |
| % | Modulus |

## **Comparison Operators**

| Operator | Name |
| --- | --- |
| == | Equal |
| != | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal to |
| <= | Less than or equal to |

## **Logical Operators**

| Operator | Description |
| --- | --- |
| and | Logical AND operator |
| or | Logical OR operator |
| not | Logical NOT |

## Assignment Operators

| Operator | Description |
| --- | --- |
| = | Assign a value to a variable |
| *= | Multiplication assignment |
| /= | Division assignment |
| %= | Modulus assignment |
| += | Addition assignment |
| -= | Subtraction assignment |

# Control Flow

## If

The if statement executes a set of statements if the condition is TRUE. Otherwise, the else statement is executed.

```r
if 2==3 { 
	print("2==3 is true")
} else if 2<3 { 
	print("2<3 is true")
} else {
	print("no condition is true")
}
```

## While

```r
i = 0
while i < 10 { 
	print(i)
	i += 1
}
```

## For

```r
numbers = [1, 2, 3, 4, 5, 6, 7]

for number in numbers { 
	print(number)
}

for index from 0 to 10 by 1 { 
	print(index)
}
```

# Type Functions

Type functions are special methods that facilitates the type casting of values or do some especial operations like for `array`.

```r
bool("true")                     # returns true
int("hello")                     # returns 0
float(true)                      # returns 1.0
string(42)                       # returns "42"
array(1, 2, 3, 4)                # returns [1, 2, 3, 4]
array(repeating: 2.5, count: 4)  # returns [2.5, 2.5, 2.5, 2.5]
```

# Functions

```r
func helloWorld() {
    "Hello, World!"
}

func sum(a, b) {
    return a + b
}
```

Functions in Plato support polymorphism where the type of the parameter makes the identity of each function.

```r
func mul(a: int, b: int) {
    return a * b
}
  
func mul(a: float, b: float) {
    return a * b
}
```

The order in which you declared the function does matter in Plato.

```r
func sum(a, b) {
    return a + b
}

func sum(a: int, b: int) {
    return a + b
}

# The first function will always be called because the parameters are 
# inplicitly of any type 
```

The correct approach will require the reorder of the functions, like the following: 

```r
func sum(a: int, b: int) {
    return a + b
}

func sum(a, b) {
    return a + b
}
```

You can also use the `at` keyword before a parameter identifier to enforce its use when calling the function. 

```r
func sum(at a, at b) {
    return a + b
}

result = sum(a: 10, b: 10)
```

# Native Functions

Here are all of the built in functions.

## Foundation

- **print**

```r
print("Hello, World!", 1, 2, 3)
print(1, 2, 3, 4, separator: " ... ", terminator: "\n\n")
```

- **random**
Returns a random number within the specified range.

```r
random(1, 10)
random(0.1, 0.9)
```

## Math

- Exponential function: `exp` (base-e exponential of x)
- Logarithmic functions: `log` , `log2`, `log10`
- Trigonometric functions: `cos`, `sin`, `tan`
- Inverse trigonometric functions: `acos`, `asin`, `atan`

- Hyperbolic functions: `cosh`, `sinh`, `tanh`
- Inverse hyperbolic functions: `acosh`, `asinh`, `atanh`
- Power and root functions: `pow`, `sqrt`
- Gamma functions: `gamma`, `logGamma`

Example:

```r
pow(2, 4) # 16
sqrt(4)   # 2
cos(90)   # -0.44807363
```