# genai-infrastructure-platform

A GitHub Issues-driven Infrastructure Copilot lab using Terraform modules, GenAI, GitHub Actions and Policy as Code.

## Repositories

- [Terraform AWS modules](https://github.com/aldo2510/terraform-aws-modules)
- [Cloud governance policies](https://github.com/aldo2510/cloud-governance)

## Current MVP

1. Open an issue using the Infrastructure request template.
2. The intake workflow replies with required S3 inputs.
3. Add an issue comment with the missing values. The comment-driven Copilot uses an OpenAI-compatible chat completions endpoint to extract the request into a constrained JSON schema.
4. When parameters validate, the workflow creates a branch and Pull Request with Terraform that references the approved S3 module.

## Configure the LLM

Add repository secret named LLM_API_KEY. Optionally add repository variables:
- LLM_BASE_URL: OpenAI-compatible API base URL (defaults to https://api.openai.com/v1)
- LLM_MODEL: model identifier (defaults to gpt-4o-mini)

Use a provider account and model you are authorized to access. API usage may incur charges; GitHub Free does not automatically include LLM API credits.

## Safety boundaries

- No automatic terraform apply.
- The LLM only extracts structured parameters; deterministic code validates them.
- The module source is fixed to the approved public module repository.
- Do not put secrets or customer data in Issues.
- This is a learning MVP, not a production-ready platform. Review generated code and add CI policy checks before merging or deploying.
