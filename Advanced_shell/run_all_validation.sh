#!/bin/bash

# Check if pokemon_data folder exists
if [ ! -d "pokemon_data" ]; then
    echo "pokemon_data/ folder not found! Creating..."
    mkdir -p pokemon_data
fi

# Step 0: Fetch Pikachu data
echo "=== Fetching Pikachu ==="
./apiAutomation-0x00

# Step 1: Extract Pikachu data
echo "=== Parsing Pikachu ==="
./data_extraction_automation-0x01

# Step 2: Sequential batch fetch
echo "=== Sequential fetch of Pokémon ==="
./batchProcessing-0x02

# Step 3: Parallel batch fetch
echo "=== Parallel fetch of Pokémon ==="
./batchProcessing-0x04

# Step 4: Generate CSV report
echo "=== Generating CSV report ==="
./summaryData-0x03

# Step 5: List all JSON files
echo "=== JSON files in pokemon_data/ ==="
ls -1 pokemon_data/

# Step 6: Show CSV report
echo "=== CSV report preview ==="
cat pokemon_report.csv

echo "✅ Validation complete!"

