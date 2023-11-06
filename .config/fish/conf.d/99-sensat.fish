alias awsl "aws --endpoint http://localhost:4566"

set -gx SENSAT_PATH_ASYNC_JOBS "$HOME/workspace/async-jobs"
set -gx SENSAT_PATH_SENSAT "$HOME/workspace/platform"
set -gx SENSAT_PATH_PLATFORM "$HOME/workspace/platform"
set -gx SENSAT_PATH_PASS "$HOME/workspace/pass"
set -gx SENSAT_PATH_PRODUCT_INFRA "$HOME/workspace/product-infra"
set -gx PASSWORD_STORE_DIR "$SENSAT_PATH_PASS"
set -gx AWS_OTP_SHELL_COMMAND 'source ~/.config/zsh/sensat.sh && codegen aws'
