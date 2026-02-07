# Permission Tiers for Autonomous Agents

## Read-Only (Safe)
- Read source files
- Run tests
- Check lint/types
- View git history
- Read documentation

## Write (Controlled)
- Modify source files
- Git commit
- Git push (to branch only)
- Create PR
- Update prd.json

## Dangerous (AVOID)
- Force push
- Delete branches
- Merge to main
- Modify CI config
- Deploy to production

## Sensitive Data at Risk

| Category | Examples | Risk Level |
|----------|----------|------------|
| API Keys | OpenAI, AWS, Stripe, GitHub tokens | Critical |
| SSH Keys | ~/.ssh/id_rsa, deploy keys | Critical |
| Cloud Credentials | ~/.aws/credentials, GCP service accounts | Critical |
| Browser Data | Cookies, saved passwords, session tokens | High |
| Environment Variables | .env files, shell exports | High |
| Git Configuration | .gitconfig, credential helpers | Medium |
| Shell History | ~/.bash_history, ~/.zsh_history | Medium |
