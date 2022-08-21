defmodule Delux.MorseTest do
  use ExUnit.Case, async: true

  alias Delux.Morse
  alias Delux.Program

  doctest Morse

  test "encoding a word" do
    p = Morse.encode(:red, "TEST", words_per_minute: 20)

    # - . ... -
    assert p.red == [
             {1, 180},
             {1, 0},
             {0, 180},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 180},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 60},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 60},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 180},
             {0, 0},
             {1, 180},
             {1, 0},
             {0, 420},
             {0, 0},
             {0, 420},
             {0, 0}
           ]

    assert p.green == [{0, 2100}, {0, 0}]
    assert p.blue == [{0, 2100}, {0, 0}]

    assert p.duration == 2100
    assert Program.text_description(p) == "Morse code: TEST"
  end

  test "encoding with spaces" do
    p = Morse.encode(:green, "E E E", words_per_minute: 20)

    # .<word gap>.<word gap>.
    assert p.red == [{0, 1860}, {0, 0}]

    assert p.green == [
             {1, 60},
             {1, 0},
             {0, 420},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 420},
             {0, 0},
             {1, 60},
             {1, 0},
             {0, 420},
             {0, 0},
             {0, 420},
             {0, 0}
           ]

    assert p.blue == [{0, 1860}, {0, 0}]

    assert p.duration == 1860
    assert Program.text_description(p) == "Morse code: E E E"
  end
end
