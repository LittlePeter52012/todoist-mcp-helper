"""
Todoist MCP Server — direct-run entry point.
Usage:  python server.py
"""
import sys, os

# Allow running directly from the repo root
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "src"))

from todoist_mcp.server import main

if __name__ == "__main__":
    main()
