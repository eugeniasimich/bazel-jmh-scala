package com.example
import org.openjdk.jmh.annotations._

@State(Scope.Benchmark)
class Bench {
	val size = 1_000_000
	val input = 1 to size

	@Benchmark def vectorAppend: Vector[Int] =
		input.foldLeft(Vector.empty[Int])({ case (acc, next) => acc.appended(next)})

	@Benchmark def listPrependAndReverse: List[Int] =
		input.foldLeft(List.empty[Int])({ case (acc, next) => acc.prepended(next)}).reverse
}
