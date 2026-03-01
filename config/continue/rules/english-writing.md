---
name: English Writing Rules
description: Rules for writing consistent English in code and documentation.
---

1. Style Matching
   - Follow the project's existing dialect (e.g., `color` vs. `colour`) and style guide.
   - Default to British English only if no style is established.
2. Avoid Churn
   - Do not change existing spelling/dialect in untouched text. Only adjust wording/spelling when modifying the text for a functional reason.
3. Terminology & Identifiers
   - When referring to code identifiers (variables, function names, JSON keys, config keys, CLI flags), reproduce them exactly as they appear in the codebase. For example, if the identifier is `api_key`, do not write `apiKey` or `API key` when you mean the identifier.
