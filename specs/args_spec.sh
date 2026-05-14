# shellspec shell=bash

Describe 'arg helpers'
  Include bash/init.sh

  It 'preserves argv elements in arrays'
    When run bash -lc 'source bash/init.sh; declare -a items=(); arg_take_rest_array items "a b" "*" ""; declare -p items'
    The status should eq 0
    The output should include '[0]="a b"'
    The output should include '[1]="*"'
    The output should include '[2]=""'
  End

  It 'fails if the target array was not declared'
    When run bash -lc 'source bash/init.sh; unset missing 2>/dev/null || true; arg_take_rest_array missing a b'
    The status should eq 64
    The error should include 'declared first'
  End
End
