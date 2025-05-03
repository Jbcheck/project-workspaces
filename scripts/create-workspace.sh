#!/bin/bash

# Script to create a VS Code workspace file for a project

if [ $# -lt 1 ]; then
  echo "Usage: $0 <project_path> [workspace_name]"
  exit 1
fi

PROJECT_PATH=$(realpath "$1")
WSNAME=${2:-$(basename "$PROJECT_PATH")}
WS_FILE="$PROJECT_PATH/$WSNAME.code-workspace"

echo "Creating workspace file for $PROJECT_PATH"

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

echo "Workspace file created at $WS_FILE"
echo "Open this file in VS Code using 'File > Open Workspace from File...'"