# Command AI Assistant (Bedrock Edition)

## Overview

A Zsh plugin that uses [Amazon Bedrock](https://aws.amazon.com/bedrock/) to analyze command execution and provide instant AI-powered feedback when commands fail or produce unexpected results.

![](plugin.png)

## Features ⚙️

- 🔍 Monitors command execution
- ❌ Detects failed commands
- 🤖 Provides AI-powered analysis and suggestions
- ✨ Clean, colorized output in your terminal
- ⚡ Lightweight and fast

## Prerequisites ✅

- Zsh shell ([Oh-My-Zsh!](https://ohmyz.sh/) *recommended*)
- [AWS CLI](https://aws.amazon.com/cli/)

## Quickstart ⚡

0. Install [Oh-My-Zsh!](https://github.com/ohmyzsh/ohmyzsh/wiki#welcome-to-oh-my-zsh)

    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

1. Set up credentials

    ```bash
    # Option 1: (recommended) AWS CLI
    aws configure

    # Option 2: environment variables
    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    export AWS_DEFAULT_REGION=...
    ```

2. Clone this repository to the custom plugins folder

    ```bash
    git clone https://github.com/JGalego/command-ai-bedrock.git $ZSH_CUSTOM/plugins/last-command
    ```

3. Add the plugin to `.zshrc` or just `source` it from the terminal

    ```bash
    source $ZSH_CUSTOM/plugins/last-command/last-command.plugin.zsh
    ```


## Usage 🚀

Simply use your terminal and the plugin will automatically:
- Monitor command execution
- Show exit codes
- Provide AI analysis for failed commands

    ```console
    $ ls /nonexistent
    ls: cannot access '/nonexistent': No such file or directory
    ❌ (2) ls /nonexistent

    🧙 AI Analysis:
    The command `ls /nonexistent` attempts to list the contents of the directory `/nonexistent`, but this directory does not exist, resulting in the error "No such file or directory" with an exit code of 2.

    Corrected command: `ls /path/to/existing/directory`
    💾 Suggested command added to history (press ↑ to use)
    ```