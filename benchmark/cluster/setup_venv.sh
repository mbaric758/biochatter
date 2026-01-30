echo "Activating virtualenv..."
source "$VENV/bin/activate"

# Upgrade pip
pip install --upgrade pip

# Install base dependencies first
echo "Installing base dependencies..."
pip install pytest openai pandas numpy requests || {
    echo "Failed to install base dependencies!"
    exit 1
}
echo "Base dependencies installed successfully."

# Install package dependencies from requirements.txt
REQ_FILE="$DIR/requirements.txt"
if [[ -f "$REQ_FILE" ]]; then
    echo "Installing requirements from $REQ_FILE..."
    pip install -r "$REQ_FILE" || {
        echo "Failed to install requirements from $REQ_FILE!"
        exit 1
    }
    echo "Requirements installed successfully."
else
    echo "No requirements.txt found at $REQ_FILE, skipping."
fi

# Install package in editable mode from repo root.
PACKAGE_PATH="$DIR/../../"
echo "Installing package in editable mode from $PACKAGE_PATH..."
if [[ -f "$PACKAGE_PATH/pyproject.toml" || -f "$PACKAGE_PATH/setup.py" ]]; then
    pip install -e "$PACKAGE_PATH" || {
        echo "Failed to install package in editable mode from $PACKAGE_PATH!"
        exit 1
    }
    echo "Package installed successfully."
else
    echo "No pyproject.toml or setup.py found in $PACKAGE_PATH!"
    exit 1
fi

echo "=== SETUP VENV SCRIPT FINISHED SUCCESSFULLY ==="