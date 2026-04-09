# shellspec shell=bash

Describe 'state helpers'
  Include bash/init.sh

  It 'runs a placeholder local write path'
    When run bash -lc 'source bash/init.sh; f(){ local FOO=""; state_local_set FOO bar; [[ "$FOO" == "bar" ]]; }; f'
    The status should eq 0
  End
End
