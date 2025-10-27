#!/usr/bin/env python3
"""
Create ZIP file of markdown skill for Claude upload
Maintains original folder structure for continued development
"""

import os
import zipfile
from pathlib import Path

def create_skill_zip():
    """Create ZIP file of the markdown skill folder"""
    
    # Get script directory (repo root) as absolute path
    script_dir = Path(__file__).parent.resolve()
    os.chdir(script_dir)
    
    # Paths - make source_folder absolute
    source_folder = (script_dir / "markdown").resolve()
    zip_filename = "markdown.zip"
    zip_path = script_dir / zip_filename
    
    # Verify source folder exists
    if not source_folder.exists():
        print(f"❌ ERROR: {source_folder} directory not found")
        print(f"Current directory: {os.getcwd()}")
        return False
    
    # Remove old ZIP if exists
    if zip_path.exists():
        print(f"Removing old ZIP file: {zip_filename}")
        zip_path.unlink()
    
    print(f"Creating {zip_filename}...")
    print(f"Source: {source_folder}")
    print(f"Destination: {zip_path}")
    print()
    
    # Create ZIP file
    try:
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
            # Walk through the source folder using absolute paths
            for root, dirs, files in os.walk(source_folder):
                # Skip hidden directories
                dirs[:] = [d for d in dirs if not d.startswith('.')]
                
                for file in files:
                    # Skip hidden files except .markdownlintrc
                    if file.startswith('.') and file != '.markdownlintrc':
                        continue
                    
                    # Build absolute file path
                    file_path = Path(root) / file
                    
                    # Calculate archive name relative to parent of source_folder (script_dir)
                    # This preserves "markdown/" prefix in the ZIP
                    arcname = str(file_path.relative_to(script_dir))
                    
                    print(f"  Adding: {arcname}")
                    zipf.write(str(file_path), arcname)
        
        print()
        print("✅ SUCCESS: Created ZIP file")
        print()
        print(f"📦 File: {zip_path}")
        print(f"📏 Size: {zip_path.stat().st_size:,} bytes")
        print()
        print("📋 Contents:")
        with zipfile.ZipFile(zip_path, 'r') as zipf:
            for info in zipf.filelist:
                print(f"     {info.filename} ({info.file_size:,} bytes)")
        
        print()
        print("🚀 Next Steps:")
        print("   1. Go to https://claude.ai/settings/capabilities")
        print("   2. Enable 'Code execution and file creation'")
        print("   3. Scroll to Skills section")
        print("   4. Click 'Upload skill'")
        print(f"   5. Upload {zip_filename}")
        print("   6. Toggle the skill ON")
        print()
        
        return True
        
    except Exception as e:
        print(f"❌ ERROR: Failed to create ZIP file")
        print(f"   {str(e)}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = create_skill_zip()
    exit(0 if success else 1)
