# Astro Science Template

## Based on [Tapyr Template](https://github.com/Appsilon/tapyr-template) (Appsilon) [MIT License]

### Tapyr features

- `uv` for dependency management
- `pytest`/`playwright` for comprehensive app validation/testing/quality assurance

### Tapyr setup (Dev containers - Visual Studio Code)

1. **Start the Devcontainer**: Open the project in VS Code and select "Reopen in Container" when prompted, or use the Command Palette (`Ctrl+Shift+P`) and choose "Dev Containers: Reopen in Container". Alternatively, use [DevPod](https://devpod.sh/) following their instructions.
2. **Activate the virtual environment**:
   ```sh
   source .venv/bin/activate
   ```
3. **Run the application**:
   ```sh
   shiny run app.py --reload
   ```
4. **Execute tests**:
   ```sh
   pytest
   ```

*Note*: The Devcontainer might limit some `playwright` features, such as `codegen`. For full functionality, consider a local setup.

### Tapyr setup (Docker - Visual Studio Code)

1. **Clone repository**
```sh
git clone https://<PAT>github.com/DeepSkyWonder/astro_template.git
```
2. **Change to folder**
```sh
cd ./astro_template
```
3. **Build image**
```sh
docker compose build --no-cache
```
4. **Run image**
```sh
docker compose up
```
