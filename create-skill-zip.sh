#!/bin/bash

# Script to create ZIP file of markdown skill
# Run this from Git Bash in Windows

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "Current directory: $(pwd)"
echo "Creating markdown.zip..."

# Remove old ZIP if it exists
if [ -f "markdown.zip" ]; then
    echo "Removing old ZIP file..."
    rm -f markdown.zip
fi

# Create new ZIP
if [ -d "markdown" ]; then
    zip -r markdown.zip markdown/
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✓ SUCCESS: Created markdown.zip"
        echo ""
        echo "File location: $(pwd)/markdown.zip"
        echo ""
        echo "File size: $(ls -lh markdown.zip | awk '{print $5}')"
        echo ""
        echo "Next steps:"
        echo "1. Go to https://claude.ai/settings/capabilities"
        echo "2. Scroll to Skills section"
        echo "3. Click 'Upload skill'"
        echo "4. Upload markdown.zip"
        echo "5. Toggle skill ON"
    else
        echo "✗ ERROR: Failed to create ZIP file"
        exit 1
    fi
else
    echo "✗ ERROR: markdown/ directory not found"
    echo "Current directory contents:"
    ls -la
    exit 1
fi
