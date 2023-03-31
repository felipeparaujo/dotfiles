#!/usr/bin/env zsh

export SENSAT_PATH_ASYNC_JOBS="$HOME/workspace/async-jobs"
export SENSAT_PATH_SENSAT="$HOME/workspace/platform"
export SENSAT_PATH_PASS="$HOME/workspace/pass"
export SENSAT_PATH_PRODUCT_INFRA="$HOME/workspace/product-infra"
export PASSWORD_STORE_DIR="$SENSAT_PATH_PASS"
export AWS_OTP_SHELL_COMMAND='source ~/.config/zsh/sensat.sh && codegen aws'

# shellcheck source=secrets.sh
source "$ZDOTDIR/secrets.sh"

codegen() {
  case $1 in
  google)
    oathtool --totp -b "$CODEGEN_KEY_CODEGEN"
    ;;
  aws)
    oathtool --totp -b "$CODEGEN_KEY_AWS"
    ;;
  *)
    echo 'Usage: codegen [google|aws]'
    exit 1
    ;;
  esac
}

awsmfa() {
  aws sts get-session-token --profile root --serial-number "$AWS_MFA_SERIAL_NUMBER" \
    --token-code "$(codegen aws)" \
    --duration-seconds 129600  >! ~/.aws/tempcreds && \
  aws configure set aws_access_key_id "$(jq -r .Credentials.AccessKeyId ~/.aws/tempcreds)" && \
  aws configure set aws_secret_access_key "$(jq -r .Credentials.SecretAccessKey ~/.aws/tempcreds)" && \
  aws configure set aws_session_token "$(jq -r .Credentials.SessionToken ~/.aws/tempcreds)"

  INI_FILE=~/.aws/credentials

  while IFS=' = ' read -r key value; do
    if [[ $key == \[*] ]]; then
      section=$key
    elif [[ $value ]] && [[ $section == '[default]' ]]; then
      if [[ $key == 'aws_access_key_id' ]]; then
        ACCESS_KEY_ID=$value
      elif [[ $key == 'aws_secret_access_key' ]]; then
        SECRET_ACCESS_KEY=$value
      elif [[ $key == 'aws_session_token' ]]; then
        SESSION_TOKEN=$value
      fi
    fi
  done <$INI_FILE

  export AWS_ACCESS_KEY_ID=$ACCESS_KEY_ID
  export AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY
  export AWS_REGION='eu-west-2'
  export AWS_SESSION_TOKEN=$SESSION_TOKEN
}
