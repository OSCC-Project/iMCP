## iMCP
The iMCP is a mcp server for iEDA.You can use it to communicate with iEDA Tools when using LLM Model such as Qwen3, DeepSeek etc.

## Supported Tools
- Run opensource tool iEDA with script.

## Features
- Support run iEDA with script
- Support run iEDA example, default is gcd
- Support VSCode Copilot or Qwen3 Agent sdk to connect

## Build

Docker build:

```bash
cd iMCP
docker build -t mcp-ieda:1.0 .
```
you can modify the Dockerfile to suit your needs, such as change MCP_SERVER_TYPE to "stdio" or "sse". If you want to use "sse" mode, you need config mcp server use mcp-ieda-sse method below.

## Installation

### Using PIP
```
cd iMCP/
uv venv
source .venv/bin/activate
uv sync
pip install mcp-iEDA
```

After installation, you can run it as a script using:

```
export iEDA="path/to/ieda"
python -m mcp_ieda
```

## Configuration
### Usage with VS Code
you can add it to a file called `.vscode/mcp.json` in your workspace. The github Copilot extension will automatically detect and use this configuration.The iEDA Path need to be set in the environment variable according to your locol iEDA path.

- Using pip installation
The python need choose iMCP/.venv/bin/python as the python interpreter.

```json
{
    "servers": {
        "mcp-ieda": {
            "type": "stdio",
            "command": "python",
            "args": [
                "-m",
                "mcp_ieda"
            ],
            "env": {
                "iEDA": "${workspaceFolder}/scripts/design/sky130_gcd/iEDA",
                "WORKSPACE":"${workspaceFolder}/scripts/design/sky130_gcd",
                "MCP_SERVER_TYPE":"stdio"
            }
        },
        "mcp-ieda-sse": {
            "type": "sse",
            "url": "http://localhost:3002/sse"
        }
    }
}
```


- Using docker

```json
{
    "servers": {
        "mcp-ieda-docker": {
            "command": "docker",
            "args": [
                "run", 
                "-p", 
                "3002:3002",
                "-v",
                "/lib/x86_64-linux-gnu/libgomp.so.1:/lib/x86_64-linux-gnu/libgomp.so.1",
                "-v",
                "/lib/x86_64-linux-gnu/libunwind.so.8:/lib/x86_64-linux-gnu/libunwind.so.8",
                "--rm",
                "-i",
                "mcp-ieda:1.0"
            ]
        }
    }

}
```


## Usage Example
If you config mcp server as above, you can run mcp server by prompt in VSCode Copilot on Agent mode : "run iEDA example gcd". The mcp server will run iEDA example gcd and you can see the log output in the mcp server output.

## Owner
iEDA Team

## License
Mulan PSL v2