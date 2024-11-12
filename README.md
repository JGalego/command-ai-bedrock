# Command AI Assistant (Bedrock Edition)

## Overview

A Zsh plugin that uses [Amazon Bedrock](https://aws.amazon.com/bedrock/) to analyze command execution and provide instant AI-powered feedback when commands fail or produce unexpected results.

## Features

- 🔍 Monitors command execution
- ❌ Detects failed commands
- 🤖 Provides AI-powered analysis and suggestions
- ✨ Clean, colorized output in your terminal
- ⚡ Lightweight and fast

## Prerequisites

- Zsh shell ([Oh-My-Zsh!](https://ohmyz.sh/) *recommended*)
- [AWS CLI](https://aws.amazon.com/cli/)

## 🚀 Usage

Simply use your terminal. The plugin will automatically:
- Monitor command execution
- Show exit codes
- Provide AI analysis for failed commands

    ```console
    $ ls /nonexistent
    ls: cannot access '/nonexistent': No such file or directory
    ❌ (2) ls /nonexistent
    🧙‍♂️ Analysis:
    The command failed because the specified directory doesn't exist. Use 'ls -la' to check the current directory contents.
    ```