
Describe 'hello.sh'

  Include lib/hello.sh

  It 'says hello'
    When call hello ShellSpec
    The output should equal 'Hello ShellSpec!'
  End

End
