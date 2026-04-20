# ask
A minimal Bash CLI tool for asking questions to AI directly from your terminal.

## Features
- Ask questions as command arguments
- Supports piping input from other commands
- Combines piped input and command arguments into a single prompt
- Returns readable text responses
- MIT Licensed

## Requirements
- `bash`
- `curl`
- `jq`

## Installation
1. Save the script as `ask`
2. Make it executable:
   ```bash
   chmod +x ask
   ```
3. Optionally move it to your PATH for global access:
   ```bash
   mv ask /usr/local/bin/ask
   ```

## Configuration
Set the following environment variables before use:
```bash
export ASK_API_URL="https://your-api-endpoint"
export ASK_API_KEY="your-token-here"
export ASK_API_MODEL="your-model-name"
```
You can add these to your `~/.bashrc` and reload using:
```bash
source ~/.bashrc
```

## Usage
**Command argument:**
```bash
ask what is the best turkish food give me just one
İskender kebab
```

**Pipe:**
```bash
cat ask | ask what does this script do
It\'s a Bash wrapper that sends your prompt to an AI API and prints the text reply.
```

**Alias support:**
```bash
alias ask-fix="./ask 'Correct any grammatical, spelling, or punctuation errors in the input text. Input text:'"
ask-fix Rhythim
Rhythm
```

## Limitations
- The `jq` output parsing may need to be adjusted if the API response format differs
- Response may not be correctly parsed if you get an error response from the API
- Some models may require the input to be formatted as a `messages` array instead of `input` — update the request body accordingly

## Contributing
Contributions are welcome! To get started:

1. Fork the repository and clone it locally
2. Create a new branch for your change:
   ```bash
   git checkout -b my-feature
   ```
3. Implement one feature or fix one thing per PR
4. Test your changes with at least a basic argument query and a pipe query
5. Open a pull request with a clear description of what you changed and why

## License
MIT License — see [LICENSE](https://github.com/huseyinatacan/ask/blob/master/LICENSE) for details.
