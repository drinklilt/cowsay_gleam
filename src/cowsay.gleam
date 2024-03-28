import gleam/io
import gleam/string
import gleam/list
import argv

const line_max_length = 40

pub fn main() {
  let words = argv.load().arguments
  let sentence = string.join(words, " ")
  io.debug(wrap_lines(sentence))
}

pub fn wrap_lines(text: String) -> List(String) {
  case text {
    "" -> []
    _ -> {
      // Get the first 49 characters of the string
      let chunk = string.slice(from: text, at_index: 0, length: line_max_length)

      // Get the rest of the characters
      let remainder =
        string.slice(
          from: text,
          at_index: line_max_length,
          length: string.length(text) - line_max_length,
        )

      // Recursion!!
      list.append([chunk], wrap_lines(remainder))
    }
  }
}
