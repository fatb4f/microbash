# shellspec shell=bash

Describe 'ctrl_fail'
  Include bash/init.sh

  It 'returns or exits according to context'
    When run bash -lc 'source bash/init.sh; ctrl_return 23 "test"'
    The status should eq 23
  End
End
