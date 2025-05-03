# IDE Project Focus Guide

This repository contains workspace configurations and guidance for maintaining project isolation in your IDE, preventing the problem of multiple projects being accessed simultaneously.

## Common IDE Setup Instructions

### Visual Studio Code

1. **Open Single Project Folders:**
   - Use `File > Open Folder...` to open only the specific project you're working on
   - Avoid opening parent directories containing multiple projects

2. **Create Workspace Files:**
   - For each project, create a `.code-workspace` file (templates in this repo)
   - Use `File > Open Workspace from File...` to load the workspace
   - Workspaces isolate settings, extensions, and search scopes

3. **Use Multi-Root Workspaces Sparingly:**
   - If you must work with multiple projects, create a multi-root workspace and carefully configure which folders are included

### JetBrains IDEs (IntelliJ, WebStorm, PyCharm, etc.)

1. **Use Separate Project Windows:**
   - Open each project in its own window (`File > Open...`)
   - Configure `Settings > System Settings > Project Opening` to open projects in a new window

2. **Create Project-Specific Settings:**
   - Store project-specific settings in the `.idea` folder (versioned in this repo)
   - Use `.gitignore` to exclude personal settings

### Visual Studio

1. **Use Solution Files:**
   - Create separate `.sln` files for each project
   - Open only the solution you're working on

## Repository Structure

- `/vscode/` - VS Code workspace files
- `/jetbrains/` - JetBrains IDE settings
- `/visual-studio/` - Visual Studio solution templates
- `/scripts/` - Helper scripts for workspace management

## Best Practices

1. **Clone Repositories to Isolated Folders:**
   - Maintain a clear folder structure (e.g., `~/GitHub/project-a`, `~/GitHub/project-b`)
   - Avoid nested repositories

2. **Use Project-Specific `.gitignore` Files:**
   - Add IDE-specific files to your `.gitignore`
   - Sample gitignore files are provided in this repo

3. **Configure Source Control Integration:**
   - Set up your IDE to focus on the current repository only
   - Disable automatic scanning of parent directories

4. **Environment Management:**
   - Use virtual environments for language-specific projects
   - Configure your IDE to automatically detect and use the correct environment

## Troubleshooting

If your IDE still tries to access multiple projects:
- Check for file watchers or indexing settings that may scan parent directories
- Look for project configuration files that may reference external paths
- Ensure you're not using a workspace file that includes multiple projects
