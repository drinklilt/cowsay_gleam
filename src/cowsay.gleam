import gleam/io
import gleam/string
import gleam/list
import gleam/erlang.{get_line}
import argv

const line_max_length = 40

pub fn main() {
  // Command line arguments take precedence over stdin
  let words = case argv.load().arguments {
    [] -> read_all_lines()
    words -> words
  }

  let sentence = string.trim(string.join(words, " "))
  io.print(generate_bubble(sentence))
}

pub fn generate_bubble(text: String) {
  // Get wrapped lines
  let wrapped_lines = wrap_lines(text)

  // Get the length of the text
  let max_line_length =
    wrapped_lines
    |> list.fold(from: 0, with: fn(accumulator: Int, chunk: String) {
      let length = string.length(chunk)
      case length > accumulator {
        True -> length
        False -> accumulator
      }
    })

  let border = " " <> string.repeat("-", max_line_length + 2) <> "\n"
  // Add the wrapped lines to the string builder
  let content =
    wrapped_lines
    |> list.fold(from: "", with: fn(content: String, line: String) {
      string.append(
        content,
        "| "
          <> line
          <> string.repeat(" ", max_line_length - string.length(line))
          <> " |\n",
      )
    })

  border <> content <> border
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

fn read_all_lines() -> List(String) {
  // Read all lines from stdin
  case get_line("") {
    Ok(line) -> list.append([string.replace(line, "\n", "")], read_all_lines())
    Error(_) -> []
  }
}
