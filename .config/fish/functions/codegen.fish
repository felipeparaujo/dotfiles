function codegen
    switch $argv[1]
        case google
            oathtool --totp -b "$CODEGEN_KEY_CODEGEN"
        case aws
            oathtool --totp -b "$CODEGEN_KEY_AWS"
        case '*'
            echo 'Usage: codegen [google|aws]'
    end
end
