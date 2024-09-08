# PDF Type 3 Font Detector

A bash script that scans PDFs for Type 3 fonts, which are often unacceptable in academic or professional submissions. It quickly identifies Type 3 fonts, locates them within the document, and provides a concise summary.

## Features

- Scans PDFs for Type 3 fonts
- Reports total count of Type 3 fonts found
- Identifies specific pages containing Type 3 fonts
- Provides detailed information only for pages with Type 3 fonts
- Offers a clear pass/fail summary for submission requirements

## Prerequisites

This script requires the Poppler utilities. You can install them using:

- On macOS (using Homebrew):

  ```bash
  brew install poppler
  ```

- On Ubuntu or Debian:

  ```bash
  sudo apt-get install poppler-utils
  ```

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/pdf-type3-font-detector.git
   ```

2. Navigate to the script directory:

   ```bash
   cd pdf-type3-font-detector
   ```

3. Make the script executable:

   ```bash
   chmod +x check_pdf_type3_fonts.sh
   ```

## Usage

Run the script by providing the path to your PDF as an argument:

```bash
./check_pdf_type3_fonts.sh /path/to/your/pdf.pdf
```

## Output

The script will provide:

- A summary of whether Type 3 fonts were found
- If found, the total count of Type 3 fonts and the pages they appear on
- Detailed information for pages containing Type 3 fonts

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/yanxiang-wang/pdf-type3-font-detector/issues) if you want to contribute.

## Acknowledgments

- This script uses the Poppler utilities for PDF analysis.
