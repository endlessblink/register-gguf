# Ollama GGUF Model Registration

Simple Windows utility to automatically register local GGUF models with Ollama.

## Features
- 🔍 Automatic GGUF model discovery and registration
- 📁 Recursive folder scanning
- ⏭️ Skips partial downloads (.part files)
- 🔄 Progress tracking and status reporting
- ❌ Error handling and validation
- 📊 Registration summary with success/failure counts

## Requirements
- Windows 10/11
- [Ollama](https://ollama.ai) installed and running
- Administrator privileges (for model registration)
- GGUF model files in your Ollama models directory

## Quick Start
1. Download this repository
2. Right-click `scripts\windows\register-gguf-models.bat`
3. Select "Run as Administrator"
4. Wait for the registration process to complete
5. Check registered models with `ollama list`

## Default Model Location
Models should be placed in:
```
C:\Users\<Username>\.ollama\models
```

## How it Works
The script will:
1. Verify Ollama installation and prerequisites
2. Scan your models directory recursively
3. Count and validate available GGUF files
4. Register each model with Ollama
5. Provide a summary of successful/failed registrations

## Troubleshooting

### Common Issues
1. "Administrator privileges required"
   - Right-click the script and select "Run as Administrator"

2. "Ollama not found"
   - Install Ollama from [ollama.ai](https://ollama.ai)
   - Ensure Ollama is in your system PATH

3. "No GGUF models found"
   - Place your GGUF files in the correct models directory
   - Ensure files have .gguf extension
   - Check file permissions

### Getting Help
- Check the [USAGE.md](docs/USAGE.md) for detailed instructions
- Open an issue on GitHub for additional support

## Contributing
See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

## License
MIT License - see [LICENSE](LICENSE) file for details