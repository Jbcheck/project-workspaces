# VS Code Workspace Templates

## Usage

1. Copy the `template.code-workspace` file to your project directory
2. Rename it to `yourproject.code-workspace`
3. Edit the file to update the path to your project
4. In VS Code, use File > Open Workspace from File... to open this file

## Benefits

- Isolated file tree view that only shows your current project
- Project-specific settings and extensions
- Prevents VS Code from accessing unrelated project files
- Search scope limited to only the current project

## Customization

Modify the following sections in your workspace file:

- `folders`: Specify which directories to include in the workspace
- `settings`: Configure project-specific settings
- `extensions`: Recommend extensions for the project