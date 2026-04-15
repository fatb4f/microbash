# shellspec shell=bash

Describe 'word helpers'
  Include bash/init.sh

  It 'joins elements without re-splitting them'
    When call word_join ',' 'a b' '*' ''
    The output should eq 'a b,*,'
  End

  It 'checks exact membership'
    When run bash -lc 'source bash/init.sh; word_array_contains "*" "alpha" "*" "omega"'
    The status should eq 0
  End

  It 'rejects empty required values'
    When run bash -lc 'source bash/init.sh; word_require_nonempty "" sample'
    The status should eq 64
    The error should include 'sample must not be empty'
  End
End
