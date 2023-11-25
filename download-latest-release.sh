# Runs if: steps.determine-install-strategy.outputs.install-strategy == 'archive'
# With input: framework-version

# Get version from CLI input
version=$1

# Copy all root files to temporary backup directory
cp -r . ../tmp
# Download latest version of HydePHP
git clone https://github.com/hydephp/hyde.git ../hyde --depth 1
# Copy HydePHP files to root
cp -r ../hyde/* .

# Remove default pages
rm _pages/index.blade.php _pages/404.blade.php
# Copy Backup files to root
cp -r ../tmp/* .

# Remove the temporary directory.
rm -rf ../tmp

# If version is set to something other than latest, require that framework version
if [[ "$version" != "latest" ]]; then
  composer require hyde/framework:"$version" --no-install
fi
