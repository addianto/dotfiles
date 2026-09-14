# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "markitdown[docx,pptx,xlsx]==0.1.7",
#   "pymupdf4llm==1.28.2",
# ]
# ///

import sys
from pathlib import Path
from markitdown import MarkItDown
import pymupdf4llm

def read_document(file_path: str) -> str:
    path = Path(file_path)
    if not path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    ext = path.suffix.lower()

    if ext in [".pdf", ".epub"]:
        return pymupdf4llm.to_markdown(str(path))
    elif ext in [".docx", ".pptx", ".xlsx", ".html", ".zip"]:
        md = MarkItDown()
        result = md.convert(str(path))
        return result.text_content
    else:
        raise ValueError(f"Unsupported file format: {ext}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: uv run read_document.py <file_path>")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    md_content = read_document(str(input_path))
    out_path = input_path.with_suffix(".md")
    out_path.write_text(md_content, encoding="utf-8")
    print(f"Successfully generated: {out_path}")
