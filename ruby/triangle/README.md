# Triangle

Write a program that can tell you if a triangle is equilateral, isosceles, or scalene.

The program should raise an error if the triangle cannot exist.

## Hint

The triangle inequality theorem states:
z ≤ x + y
where x,y, and z are the lengths of the sides of a triangle. In other words, the
sum of the lengths of any two sides of a triangle always exceeds or is equal to
the length of the third side.

A corollary to the triangle inequality theorem is there are two classes of
triangles--degenerate and non-degenerate. If the sum of the lengths of any two
sides of a triangle is greater than the length of the third side, that triangle
is two dimensional, has area, and belongs to the non-degenerate class. In
mathematics, a degenerate case is a limiting case in which an element of a class
of objects is qualitatively different from the rest of the class and hence
belongs to another, usually simpler, class. The degenerate case of the triangle
inequality theorem is when the sum of the lengths of any two sides of a triangle
is equal to the length of the third side. A triangle with such qualities is
qualitatively different from all the triangles in the non-degenerate class since
it is one dimensional, looks like a straight line, and has no area. Such
triangles are called degenerate triangles and they belong to the degenerate
class.

## Dig Deeper

This exercise does not test for degenerate triangles. Feel free to add your own
tests to check for degenerate triangles.

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -r minitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb

## Source

The Ruby Koans triangle project, parts 1 & 2 [http://rubykoans.com](http://rubykoans.com)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

