function awsmfa
    aws sts get-session-token --profile root --serial-number "$AWS_MFA_SERIAL_NUMBER" \
        --token-code "$(codegen aws)" \
        --duration-seconds 129600 >~/.aws/tempcreds
    and aws configure set aws_access_key_id "$(jq -r .Credentials.AccessKeyId ~/.aws/tempcreds)"
    and aws configure set aws_secret_access_key "$(jq -r .Credentials.SecretAccessKey ~/.aws/tempcreds)"
    and aws configure set aws_session_token "$(jq -r .Credentials.SessionToken ~/.aws/tempcreds)"

    while read -d ' = ' -l key value
        # if no value, could be a section
        if [ -z $value ]
            set section $key
        end

        if [ -n "$value" ] && [ "$section" = '[default]' ]
            if [ $key = aws_access_key_id ]
                set -gx AWS_ACCESS_KEY_ID $value
            else if [ $key = aws_secret_access_key ]
                set -gx AWS_SECRET_ACCESS_KEY $value
            else if [ $key = aws_session_token ]
                set -gx AWS_SESSION_TOKEN $value
            end
        end
    end <~/.aws/credentials
end
