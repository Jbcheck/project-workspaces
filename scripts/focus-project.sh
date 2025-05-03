#!/bin/bash

# Script to help focus on a single GitHub project by setting up isolated environment
# Usage: ./focus-project.sh <path-to-project>

if [ $# -lt 1 ]; then
  echo "Usage: $0 <project_path>"
  exit 1
fi

PROJECT_PATH=$(realpath "$1")
PROJECT_NAME=$(basename "$PROJECT_PATH")

# Check if project directory exists
if [ ! -d "$PROJECT_PATH" ]; then
  echo "Error: Project directory does not exist: $PROJECT_PATH"
  exit 1
fi

echo "🔍 Focusing on project: $PROJECT_NAME at $PROJECT_PATH"

# Create a VS Code workspace file if it doesn't exist
WS_FILE="$PROJECT_PATH/$PROJECT_NAME.code-workspace"
if [ ! -f "$WS_FILE" ]; then
  echo "📄 Creating VS Code workspace file..."
  cat > "$WS_FILE" << EOL
{
	"folders": [
		{
			"path": "."
		}
	],
	"settings": {
		"files.exclude": {
			"**/node_modules": true,
			"**/dist": true
		},
		"search.exclude": {
			"**/node_modules": true,
			"**/dist": true
		},
		"files.watcherExclude": {
			"**/.git/objects/**": true,
			"**/node_modules/**": true
		}
	}
}
EOL
  echo "✅ Workspace file created at $WS_FILE"
fi

# Check if .gitignore exists, add IDE-specific entries if needed
GITIGNORE_FILE="$PROJECT_PATH/.gitignore"
if [ ! -f "$GITIGNORE_FILE" ]; then
  echo "📄 Creating .gitignore file..."
  cat > "$GITIGNORE_FILE" << EOL
# IDE files
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# JetBrains IDEs
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/**/usage.statistics.xml
.idea/**/dictionaries
.idea/**/shelf
*.iml
*.ipr
*.iws
EOL
  echo "✅ .gitignore file created"
else
  # Check if IDE entries exist in .gitignore
  if ! grep -q "\.vscode" "$GITIGNORE_FILE" && ! grep -q "\.idea" "$GITIGNORE_FILE"; then
    echo "📝 Updating .gitignore with IDE-specific entries..."
    cat >> "$GITIGNORE_FILE" << EOL

# IDE files
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# JetBrains IDEs
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/**/usage.statistics.xml
.idea/**/dictionaries
.idea/**/shelf
*.iml
*.ipr
*.iws
EOL
    echo "✅ .gitignore updated"
  fi
fi

# Open VS Code with the workspace if VS Code is installed
if command -v code &> /dev/null; then
  echo "🚀 Opening VS Code with isolated workspace..."
  code "$WS_FILE"
elif command -v idea &> /dev/null; then
  echo "🚀 Opening IntelliJ IDEA with project..."
  idea "$PROJECT_PATH"
else
  echo "ℹ️ No supported IDE found. Please open the project manually:"
  echo "   - VS Code: Use File > Open Workspace from File... and select $WS_FILE"
  echo "   - JetBrains IDE: Open project $PROJECT_PATH"
fi

echo "✨ Project focus complete! Now working on: $PROJECT_NAME"
echo "💡 Tips for maintaining focus:"
echo "   1. Only open one project at a time"
echo "   2. Close other IDE windows before starting work"
echo "   3. Use the workspace file to isolate your view"
echo "   4. Run this script again to switch projects"
