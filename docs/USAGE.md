# Detailed Usage Guide

## Prerequisites
1. **Windows System Requirements**
   - Windows 10 or Windows 11
   - Administrator privileges
   - PowerShell 5.1 or later (included with Windows)

2. **Ollama Installation**
   - Download from [ollama.ai](https://ollama.ai)
   - Complete the installation process
   - Verify installation: Open Command Prompt and run `ollama --version`

## Installation
1. Download the repository
2. Extract to your preferred location
3. No additional installation required

## Running the Script
1. **Prepare Your Models**
   - Place GGUF files in: `%USERPROFILE%\.ollama\models`
   - Supported formats: `.gguf`
   - Partial downloads (`.part`) are automatically skipped

2. **Execute the Script**
   - Navigate to `scripts\windows`
   - Right-click `register-gguf-models.bat`
   - Select "Run as Administrator"
   - Follow on-screen instructions

3. **Monitor Progress**
   - Script shows real-time registration status
   - Green checkmarks (√) indicate success
   - Red crosses (×) indicate failures
   - Final summary shows total success/failure count

## Model Naming
- Models are registered using their filename (without extension)
- Examples:
  - `mistral-7b-v0.1.Q4_K_M.gguf` → `mistral-7b-v0.1.Q4_K_M`
  - `llama2-7b-chat.Q4_K_M.gguf` → `llama2-7b-chat.Q4_K_M`

## After Registration
1. Verify registration:
   ```bash
   ollama list
   ```

2. Test a model:
   ```bash
   ollama run model-name
   ```

## Troubleshooting

### Error Messages

1. "Administrator privileges required"
   - Solution: Run as Administrator
   - Right-click script → "Run as Administrator"

2. "Ollama not found"
   - Solution: Install Ollama
   - Verify PATH environment variable
   - Restart computer after installation

3. "No GGUF models found"
   - Check model directory exists
   - Verify file extensions are `.gguf`
   - Check file permissions

### Common Issues

1. **Model Already Exists**
   - Remove existing model: `ollama rm model-name`
   - Run script again

2. **Registration Fails**
   - Verify model file isn't corrupted
   - Check available disk space
   - Ensure Ollama service is running

3. **Permission Issues**
   - Run Command Prompt as Administrator
   - Check file/folder permissions
   - Verify user has write access

## Best Practices
1. Keep model files organized
2. Use descriptive filenames
3. Remove partial downloads
4. Backup models before registration
5. Monitor disk space usage