
Describe 'cloud foundry cli'
  
    It 'uses the correct version'

        When call cf version
        The output should match pattern 'cf version 7.*'

    End

    It 'can target the VMware Tanzu cf api'
        Mock cf
            command=${1:?command null or not set}
            if [ "api" = "$command" ]; then
                api=${2:?api null or not set}
                echo "API endpoint:   $api"
            elif [ "curl" = "$command" ]; then
                path=${2:?path null or not set}
                if [ "/v3/info" = "$path" ]; then
                    echo '{ "name": "VMware Tanzu Application Service" }'
                else
                    echo "unsupported path for Mock cf curl: $path"
                    exit 1
                fi
            else
                echo "unsupported command for Mock cf: $command"
                exit 1
            fi 
        End

        When call cf api https://api.example.com
        The output should include 'API endpoint:   https://api.example.com'

        is_vmware_tas() {
            cf curl /v3/info | jq -e '.name == "VMware Tanzu Application Service"' >/dev/null
        }
        Assert is_vmware_tas
    End

End
