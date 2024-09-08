#!/bin/bash

# Check if a PDF file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide a PDF file as an argument."
    echo "Usage: $0 /path/to/your/pdf.pdf"
    exit 1
fi

pdf_file="$1"

# Check if the file exists
if [ ! -f "$pdf_file" ]; then
    echo "File not found: $pdf_file"
    exit 1
fi

# Get the number of pages in the PDF
num_pages=$(pdfinfo "$pdf_file" | grep Pages: | awk '{print $2}')

echo "Analyzing fonts in $pdf_file (Total pages: $num_pages)"

# Function to get font info for a specific page
get_font_info() {
    pdffonts -f $1 -l $1 "$pdf_file" | tail -n +3
}

# Variables to store Type 3 font information
type3_pages=()
type3_count=0

# Check each page for Type 3 fonts
for ((i=1; i<=num_pages; i++)); do
    page_fonts=$(get_font_info $i)
    if echo "$page_fonts" | grep -q "Type 3"; then
        type3_pages+=($i)
        type3_count=$((type3_count + $(echo "$page_fonts" | grep -c "Type 3")))
    fi
done

echo "Font Summary:"
echo "-------------"
if [ $type3_count -eq 0 ]; then
    echo "✓ No Type 3 fonts found. This PDF meets the font requirements for submission."
else
    echo "✗ Type 3 fonts found. This PDF does not meet the font requirements for submission."
    echo "  Total Type 3 fonts: $type3_count"
    echo "  Pages with Type 3 fonts: ${type3_pages[*]}"
    echo
    echo "Detailed Type 3 Font Information:"
    echo "---------------------------------"
    for page in "${type3_pages[@]}"; do
        echo "PAGE $page"
        get_font_info $page | grep "Type 3"
        echo
    done
fi

echo "Finished analyzing all $num_pages pages."