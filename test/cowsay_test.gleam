import gleeunit
import gleeunit/should
import cowsay

pub fn main() {
  gleeunit.main()
}

pub fn wrap_lines_short_test() {
  cowsay.wrap_lines("cowsay")
  |> should.equal(["cowsay"])
}

pub fn wrap_lines_long_test() {
  cowsay.wrap_lines(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
  )
  |> should.equal([
    "cowsay cowsay cowsay cowsay cowsay cowsa",
    "y cowsay cowsay cowsay cowsay cowsay",
  ])
}

pub fn wrap_lines_very_long_test() {
  cowsay.wrap_lines(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
  )
  |> should.equal([
    "cowsay cowsay cowsay cowsay cowsay cowsa",
    "y cowsay cowsay cowsay cowsay cowsay cow",
    "say cowsay cowsay cowsay cowsay cowsay c", "owsay cowsay",
  ])
}
