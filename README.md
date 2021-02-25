# VSCode Python

_Goal: Test basic remote Python debugging setup in VSCode_

**Setup VSCode**

`code --install-extension ms-python.python` or search for ext in vscode

**Pip install or conda install ptvsd**

`conda install ptvsd`

Copy package into Maya installation site-packages or somewhere on the PYTHONPATH

`cp "C:\Users\$USER\miniconda2\envs\maya-usd\Lib\site-packages\ptvsd" "C:\Program Files\Autodesk\$MAYA_VERSION\Python\Lib\site-packages"`

**Create configuration**

`Ctrl + Shift + D` in vscode and create a _launch.json_

**Example configuration**

Follow the prompts, filling in _3000_ for the port and a few others. The finished config should look similar to:

```json
{
	"folders": [
		{
			"path": "D:\\git\\maya\\vscode-python"
		}
	],
	"settings": {},
	"launch": {
		"version": "0.2.0",
		"configurations": [
			{
				"name": "Python: Remote Attach",
				"type": "python",
				"request": "attach",
				"connect": {
					"host": "localhost",
					"port": 3000
				},
				"pathMappings": [
					{
						"localRoot": "${workspaceFolder}",
						"remoteRoot": "."
					}
				]
			}
		]
	}
}
```

**Run code to enable attach in Maya**

```py
import ptvsd
ptvsd.enable_attach(address=('0.0.0.0', 3000), redirect_output=True)
```

**Attach in VSCode**

In vscode, click _Attach (Remote Debug)_, and add breakpoints

**Start debugging!**

Run code in Maya to trigger breakpoint and code inspection in vscode!
