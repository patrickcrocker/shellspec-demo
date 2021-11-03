
Describe 'list directory'

    It 'shows contents'
        When call ls
        The output should include "README.md"
    End

    It 'shows an error with invalid arguments'
        When call ls -9
        The status should equal 2
        The error should include "ls: invalid option -- '9'"
    End

End
