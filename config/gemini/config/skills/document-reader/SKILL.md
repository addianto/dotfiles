---
name: document-reader
description: Converts PDF, EPUB, and Office documents (.docx, .pptx, .xlsx) into structured Markdown for LLM context.
---

# Document Reader

Runs document conversion to Markdown using isolated PEP 723 script execution via `uv run` command.
The conversion script is available at [`scripts/read_document.py`](scripts/read_document.py).

## Execution Command

Run the script directly using the following command:

```shell
uv run ./scripts/read_document.py "path/to/document.pdf"
```

No need to provision the dependencies using `pip`.
It will be managed by `uv run` based on the script metadata.
