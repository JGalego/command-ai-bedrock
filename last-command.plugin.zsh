# Function to call Amazon Bedrock and get analysis
analyze_command() {
    local cmd="$1"
    local exit_code="$2"
    local error_output="$3"
    local model=${BEDROCK_MODEL_ID:="anthropic.claude-3-sonnet-20240229-v1:0"}
    
    # Prepare the prompt
    local prompt="Analyze this command and its error.\\n\\nCommand: $cmd\\nExit Code: $exit_code\\nError Output: $error_output\\n\\nProvide a very brief (1-2 lines) explanation of what happened and if possible provide a corrected command in backticks with the format \\\"Corrected command:\\\""

    # Call model using Converse API
    local analysis=$(aws bedrock-runtime converse --model-id $model --messages "{\"role\": \"user\", \"content\": [{\"text\": \"$prompt\"}]}" --query 'output.message.content[0].text' --output text)

    # Extract command between backticks after "Corrected command: " if present
    if [[ $analysis =~ "Corrected command: "\`([^\`]+)\` ]]; then
        local suggested_command="${match[1]}"
        # Add to ZSH history
        fc -R =(print -r -- "$suggested_command")
        echo "$analysis"
        echo "\033[32m💾 Suggested command added to history (press ↑ to use)\033[0m"
    else
        echo "$analysis"
    fi
}

# Function to be called before each command
# https://zsh.sourceforge.io/Doc/Release/Functions.html#Hook-Functions
preexec() {
    LAST_COMMAND="$1"
    COMMAND_TIME=$(date "+%H:%M:%S")
}

# Function to be called after each command
precmd() {
    local EXIT_CODE=$?
    
    if [[ -n "$LAST_COMMAND" ]]; then
        local STATUS_SYMBOL
        if [ $EXIT_CODE -eq 0 ]; then
            STATUS_SYMBOL="\033[32m✅ \033[0m"
        else
            STATUS_SYMBOL="\033[31m❌ ($EXIT_CODE)\033[0m"
            # Capture both stdout and stderr
            local OUTPUT=$(eval "$LAST_COMMAND" 2>&1)
            echo $STATUS_SYMBOL $LAST_COMMAND
            echo "\033[34m🧙‍♂️ AI Analysis:\033[0m"
            analyze_command "$LAST_COMMAND" "$EXIT_CODE" "$OUTPUT"
        fi
    fi
    
    LAST_COMMAND=""
}