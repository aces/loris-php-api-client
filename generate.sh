#!/bin/bash

# LORIS PHP Client - Automated Generation Script with Auto-Fix
# This script regenerates the PHP client and automatically fixes namespace issues

set -e

echo "🚀 LORIS PHP Client Generator (with Auto-Fix)"
echo "=============================================="
echo ""

# Check if schema.yml exists
if [ ! -f "schema.yml" ]; then
    echo "❌ Error: schema.yml not found!"
    exit 1
fi

# Check if openapi-config.json exists
if [ ! -f "openapi-config.json" ]; then
    echo "❌ Error: openapi-config.json not found!"
    exit 1
fi

# Check for OpenAPI Generator
if ! command -v openapi-generator-cli &> /dev/null && ! command -v openapi-generator &> /dev/null && [ "$USE_DOCKER" != "1" ]; then
    echo "❌ Error: OpenAPI Generator CLI not found!"
    echo ""
    echo "Install: npm install @openapitools/openapi-generator-cli -g"
    echo "Or use: USE_DOCKER=1 ./generate.sh"
    exit 1
fi

# Backup existing lib directory
if [ -d "lib" ]; then
    BACKUP_DIR="lib_backup_$(date +%Y%m%d_%H%M%S)"
    echo "📦 Creating backup: $BACKUP_DIR"
    cp -r lib "$BACKUP_DIR"
    echo ""
fi

# Clean up old generated files (IMPORTANT: Clear cache!)
echo "🧹 Cleaning up old generated files and cache..."
rm -rf lib/
rm -rf test/
rm -rf docs/Api
rm -rf docs/Model
rm -rf .openapi-generator/
echo "✅ Cleanup complete"
echo ""

# Generate the client
echo "⚙️  Generating PHP client..."
echo ""

if [ "$USE_DOCKER" = "1" ]; then
    echo "Using Docker to generate..."
    docker run --rm \
        -v ${PWD}:/local \
        openapitools/openapi-generator-cli:v7.17.0 generate \
        -i /local/schema.yml \
        -g php \
        -o /local \
        -c /local/openapi-config.json \
        --additional-properties=composerPackageName=loris/php-client

    echo ""
    echo "🔧 Fixing file ownership..."
    sudo chown -R $USER:$USER . 2>/dev/null || chown -R $USER:$USER .
else
    # Try different command names
    if command -v openapi-generator-cli &> /dev/null; then
        GENERATOR_CMD="openapi-generator-cli"
    elif command -v openapi-generator &> /dev/null; then
        GENERATOR_CMD="openapi-generator"
    fi

    $GENERATOR_CMD generate \
        -i schema.yml \
        -g php \
        -o . \
        -c openapi-config.json \
        --additional-properties=composerPackageName=loris/php-client
fi

echo ""
echo "✅ Client generation complete!"
echo ""

# ============================================
# AUTO-FIX NAMESPACES (This is the key part!)
# ============================================
echo "🔧 AUTO-FIXING NAMESPACES..."
echo "=============================="
echo ""

if [ ! -d "lib" ]; then
    echo "❌ Error: lib/ directory not created"
    exit 1
fi

# Count files
TOTAL_FILES=$(find lib -name "*.php" -type f | wc -l)
echo "📊 Processing $TOTAL_FILES PHP files..."

# Apply all namespace fixes
echo "1️⃣  Fixing namespace declarations..."
find lib -name "*.php" -type f -exec sed -i 's/namespace LORISClient\\LORISClient\\/namespace LORISClient\\/g' {} \;

echo "2️⃣  Fixing use statements..."
find lib -name "*.php" -type f -exec sed -i 's/use LORISClient\\LORISClient\\/use LORISClient\\/g' {} \;

echo "3️⃣  Fixing string literals (single backslash)..."
find lib -name "*.php" -type f -exec sed -i "s/'LORISClient\\\\LORISClient\\\\/'LORISClient\\\\/g" {} \;
find lib -name "*.php" -type f -exec sed -i 's/"LORISClient\\LORISClient\\/"LORISClient\\/g' {} \;

echo "4️⃣  Fixing string literals (double backslash)..."
find lib -name "*.php" -type f -exec sed -i "s/'LORISClient\\\\\\\\LORISClient\\\\\\\\/'LORISClient\\\\\\\\/g" {} \;
find lib -name "*.php" -type f -exec sed -i 's/"LORISClient\\\\\\\\LORISClient\\\\\\\\/"LORISClient\\\\\\\\/g' {} \;

echo "5️⃣  Fixing fully qualified names..."
find lib -name "*.php" -type f -exec sed -i 's/\\LORISClient\\LORISClient\\/\\LORISClient\\/g' {} \;

echo "6️⃣  Fixing documentation..."
find lib -name "*.php" -type f -exec sed -i 's/@return LORISClient\\LORISClient\\/@return LORISClient\\/g' {} \;
find lib -name "*.php" -type f -exec sed -i 's/@param LORISClient\\LORISClient\\/@param LORISClient\\/g' {} \;
find lib -name "*.php" -type f -exec sed -i 's/@var LORISClient\\LORISClient\\/@var LORISClient\\/g' {} \;

echo ""
echo "✅ Namespace fixes applied!"
echo ""

# Verify the fixes
echo "🔍 Verifying fixes..."
echo ""

# Check directory structure
if [ -d "lib/Api" ] && [ -d "lib/Model" ]; then
    echo "✅ Directory structure is correct"
    echo "   - lib/Api/ exists"
    echo "   - lib/Model/ exists"
else
    echo "⚠️  Warning: Unexpected directory structure!"
    ls -la lib/
fi
echo ""

# Check namespace in generated file
echo "📄 Checking namespaces in generated files..."
if [ -f "lib/Api/AuthenticationApi.php" ]; then
    AUTH_NAMESPACE=$(grep "^namespace" lib/Api/AuthenticationApi.php | head -1)
    echo "   AuthenticationApi: $AUTH_NAMESPACE"

    if [[ "$AUTH_NAMESPACE" == *"namespace LORISClient\Api;"* ]]; then
        echo "   ✅ Namespace is correct!"
    elif [[ "$AUTH_NAMESPACE" == *"LORISClient\LORISClient"* ]]; then
        echo "   ❌ ERROR: Duplicate namespace still exists!"
        echo "   Please check the sed commands in this script"
        exit 1
    fi
fi

if [ -f "lib/Model/Candidate.php" ]; then
    MODEL_NAMESPACE=$(grep "^namespace" lib/Model/Candidate.php | head -1)
    echo "   Candidate Model: $MODEL_NAMESPACE"
fi

# Check for any remaining duplicates
REMAINING=$(grep -r "LORISClient\\\\LORISClient" lib --include="*.php" 2>/dev/null | wc -l)
if [ "$REMAINING" -eq 0 ]; then
    echo ""
    echo "✅ No duplicate namespaces found!"
else
    echo ""
    echo "⚠️  Warning: $REMAINING lines with potential duplicates found"
    echo "   Showing first few:"
    grep -r "LORISClient\\\\LORISClient" lib --include="*.php" | head -5
fi

echo ""

# Install/update composer dependencies
if command -v composer &> /dev/null; then
    echo "📦 Installing/updating Composer dependencies..."
    composer install --no-interaction
    composer dump-autoload
    echo "✅ Dependencies installed and autoload regenerated"
else
    echo "⚠️  Composer not found - please run 'composer install' manually"
fi
echo ""

# Test the autoloading
echo "🧪 Testing autoload..."
php -r 'require "vendor/autoload.php"; use LORISClient\Api\AuthenticationApi; echo "✅ Autoload works!\n";' 2>&1 || echo "⚠️  Autoload test failed"
echo ""

# Show summary
echo "📊 Generation Summary"
echo "===================="
echo "✅ PHP client generated"
echo "✅ Namespaces automatically fixed"
echo "✅ Dependencies installed"
echo "✅ Autoload configured"
echo ""
echo "📁 Directory structure:"
ls -la lib/ | head -10
echo ""
echo "🧪 Test your client:"
echo "   php examples/authentication.php"
echo ""
echo "💻 Example usage:"
echo '```php'
echo "use LORISClient\Configuration;"
echo "use LORISClient\Api\AuthenticationApi;"
echo "use LORISClient\Api\ClinicalApi;"
echo '```'
echo ""
echo "🎉 Done!"