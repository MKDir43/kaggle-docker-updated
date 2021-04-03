# kaggle-python-updated

The official kaggle [dockerfile](https://github.com/Kaggle/docker-python) has an older version of CUDA installed, which may cause build errors when using the latest GPU or the latest CNN framework.
This dockerfile will import the official kaggle dockerfile, install the latest CUDA, and install conda.

- Installing the latest CUDA and conda update
- Same directory structure as kaggle code (/kaggle/input,working)
- Read APIKey under home (~/.kaggle/kaggle.json)

## Usage

Launches a script that performs docker build, container creation and startup.

```
$ cd kaggle-python-updated
$ . /docker/launch_container.sh
(container) $ . 
```

If you want to change the name of the container or the image to be generated, modify CONTAINER_NAME and IMAGE_NAME at the top of launch_container.sh.

After the shell of the container is launched, start Jupyter Lab.

```
(container) $ jupyter lab
```

## VS Code integration

You can use VSCode's devcontainer.

- Open the top directory of this repository in VSCode
- Install the extension: Remote-Containers
- Click on the icon at the bottom left of the VSCode window and click on "Reopen in Containers
