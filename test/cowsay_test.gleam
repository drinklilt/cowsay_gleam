import gleeunit
import gleeunit/should
import cowsay
import cows.{default}

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

pub fn generate_bubble_short_test() {
  cowsay.generate_bubble("cowsay")
  |> should.equal(" --------\n| cowsay |\n --------\n")
}

pub fn generate_bubble_long_test() {
  cowsay.generate_bubble(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
  )
  |> should.equal(
    " ------------------------------------------\n| cowsay cowsay cowsay cowsay cowsay cowsa |\n| y cowsay cowsay cowsay cowsay cowsay     |\n ------------------------------------------\n",
  )
}

pub fn generate_bubble_very_long_test() {
  cowsay.generate_bubble(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
  )
  |> should.equal(
    " ------------------------------------------\n| cowsay cowsay cowsay cowsay cowsay cowsa |\n| y cowsay cowsay cowsay cowsay cowsay cow |\n| say cowsay cowsay cowsay cowsay cowsay c |\n| owsay cowsay                             |\n ------------------------------------------\n",
  )
}

pub fn draw_default_short_test() {
  cowsay.draw("cowsay", default)
  |> should.equal(
    " --------
| cowsay |
 --------
   \\   ^__^ 
     \\ (oo)\\_______
       (__)\\       )\\/\\
           ||----W||
           ||     ||\n",
  )
}

pub fn draw_default_long_test() {
  cowsay.draw(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
    default,
  )
  |> should.equal(
    " ------------------------------------------
| cowsay cowsay cowsay cowsay cowsay cowsa |
| y cowsay cowsay cowsay cowsay cowsay     |
 ------------------------------------------
   \\   ^__^ 
     \\ (oo)\\_______
       (__)\\       )\\/\\
           ||----W||
           ||     ||\n",
  )
}

pub fn draw_default_very_long_test() {
  cowsay.draw(
    "cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay cowsay",
    default,
  )
  |> should.equal(
    " ------------------------------------------
| cowsay cowsay cowsay cowsay cowsay cowsa |
| y cowsay cowsay cowsay cowsay cowsay cow |
| say cowsay cowsay cowsay cowsay cowsay c |
| owsay cowsay                             |
 ------------------------------------------
   \\   ^__^ 
     \\ (oo)\\_______
       (__)\\       )\\/\\
           ||----W||
           ||     ||\n",
  )
}
