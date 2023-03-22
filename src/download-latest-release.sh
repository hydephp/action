# Runs if: steps.determine-install-strategy.outputs.install-strategy == 'archive'
# With input: framework-version

# Copy all root files to backup directory
cp -r . ../backup
# Download latest version of HydePHP
git clone https://github.com/hydephp/hyde.git ../hyde --depth 1
# Copy HydePHP files to root
cp -r ../hyde/* .
# Remove default pages
rm _pages/index.blade.php _pages/404.blade.php
# Copy Backup files to root
cp -r ../backup/* .

# If version is set to something other than latest, require that framework version
if [[ "${{ inputs.framework-version }}" != "latest" ]]; then
composer require hyde/framework:${{ inputs.framework-version }} --no-install
fi
