# shellspec shell=bash

Describe 'out_line and err_line'
  Include bash/init.sh

  It 'writes stdout data'
    When call out_line 'hello'
    The output should eq 'hello'
  End

  It 'writes stderr diagnostics'
    When run bash -lc 'source bash/init.sh; err_line "oops"'
    The status should eq 0
    The error should include 'oops'
  End
End
